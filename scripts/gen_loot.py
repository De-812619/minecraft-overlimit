#!/usr/bin/env python3
"""Generate over_limit_pack loot tables from the 26.2 client jar (+ DnT)."""

from __future__ import annotations

import json
import os
import re
import shutil
import urllib.request
import zipfile
from itertools import combinations
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_JAR = Path(
    "/Users/okanoueyuuichi/Library/Application Support/PrismLauncher/"
    "libraries/com/mojang/minecraft/26.2/minecraft-26.2-client.jar"
)
# Dungeons and Taverns v5.3.0 (datapack zip for 26.2)
DEFAULT_DNT_URL = (
    "https://cdn.modrinth.com/data/tpehi7ww/versions/QcyHA7j1/"
    "Dungeons%20and%20Taverns%20v5.3.0.zip"
)
CACHE_DIR = ROOT / ".cache"

TARGET_CHESTS = [
    "ancient_city",
    "ancient_city_ice_box",
    "desert_pyramid",
    "jungle_temple",
    "shipwreck_map",
    "shipwreck_supply",
    "shipwreck_treasure",
    "underwater_ruin_big",
    "underwater_ruin_small",
    "abandoned_mineshaft",
    "buried_treasure",
    # 試練の間: チェスト3種＋宝物庫親テーブルのみ（樽・壺・入れ子 reward_* は対象外）
    "trial_chambers/entrance",
    "trial_chambers/supply",
    "trial_chambers/intersection",
    "trial_chambers/reward",
    "trial_chambers/reward_ominous",
    "nether_bridge",
    "bastion_bridge",
    "bastion_hoglin_stable",
    "bastion_other",
    "bastion_treasure",
    "end_city_treasure",
]

# 海底神殿はバニラにチェストが無いため、エルダーガーディアンのドロップへ注入。
TARGET_ENTITY_LOOT = [
    "elder_guardian",
]

MATERIAL_WEIGHTS = (
    ("iron", 35),
    ("diamond", 55),
    ("netherite", 10),
)

# 追加個数の比率: 0個 / 1個 / 2個（CONTENT.md）
INJECT_COUNT_WEIGHTS = (15, 70, 15)

INJECT_POOL = {
    "rolls": 1.0,
    "entries": [
        {
            "type": "minecraft:empty",
            "weight": INJECT_COUNT_WEIGHTS[0],
        },
        {
            "type": "minecraft:loot_table",
            "value": "overlimit:bonus_gear",
            "weight": INJECT_COUNT_WEIGHTS[1],
        },
        {
            "type": "minecraft:group",
            "weight": INJECT_COUNT_WEIGHTS[2],
            "children": [
                {
                    "type": "minecraft:loot_table",
                    "value": "overlimit:bonus_gear",
                },
                {
                    "type": "minecraft:loot_table",
                    "value": "overlimit:bonus_gear",
                },
            ],
        },
    ],
}

CHEST_MEMBER_RE = re.compile(r"^data/([^/]+)/loot_table/(chests/.+)\.json$")


def uniform(lo: int, hi: int) -> dict:
    return {"type": "minecraft:uniform", "min": float(lo), "max": float(hi)}


def random_chance(chance: float) -> dict:
    return {"condition": "minecraft:random_chance", "chance": chance}


def set_enchantments(
    enchants: dict,
    *,
    add: bool,
    chance: float | None = None,
) -> dict:
    fn: dict = {
        "function": "minecraft:set_enchantments",
        "enchantments": enchants,
        "add": add,
    }
    if chance is not None:
        fn["conditions"] = [random_chance(chance)]
    return fn


# 通常エンチャント一式（アイテム全体で1回）。エンドシティ相当。
NORMAL_ENCHANT_CHANCE = 0.5
NORMAL_ENCHANT_LEVELS = uniform(20, 39)

# 追加（上限超え）エンチャント。共通枠 + 種別ごとのレア枠。
COMMON_BONUS: list[tuple[str, int | dict, float]] = [
    ("minecraft:unbreaking", uniform(4, 10), 0.30),
]

# kind -> [(enchant_id, level_or_provider, chance), ...]
# フェニックス・ドッペルゲンガー・アストラルフローは保留のため入れない。
BONUS_ENCHANTS: dict[str, list[tuple[str, int | dict, float]]] = {
    "sword": [
        *COMMON_BONUS,
        ("minecraft:sharpness", uniform(6, 10), 0.30),
        ("minecraft:sweeping_edge", uniform(4, 10), 0.30),
        ("overlimit:apocalypse", 1, 0.30),
        ("overlimit:void_break", 1, 0.30),
        ("overlimit:hyper_gravity", 1, 0.30),
        ("overlimit:necromancy", 1, 0.30),
    ],
    "axe": [
        *COMMON_BONUS,
        ("minecraft:sharpness", uniform(6, 10), 0.30),
        ("minecraft:efficiency", uniform(6, 10), 0.30),
        ("overlimit:apocalypse", 1, 0.30),
        ("overlimit:void_break", 1, 0.30),
        ("overlimit:hyper_gravity", 1, 0.30),
        ("overlimit:impact", 1, 0.30),
    ],
    "spear": [
        *COMMON_BONUS,
        ("minecraft:sharpness", uniform(6, 10), 0.30),
        ("minecraft:lunge", uniform(4, 10), 0.30),
        ("overlimit:apocalypse", 1, 0.30),
        ("overlimit:void_break", 1, 0.30),
        ("overlimit:hyper_gravity", 1, 0.30),
    ],
    "pickaxe": [
        *COMMON_BONUS,
        ("minecraft:efficiency", uniform(6, 10), 0.30),
        ("minecraft:fortune", uniform(4, 5), 0.30),
    ],
    "shovel": [
        *COMMON_BONUS,
        ("minecraft:efficiency", uniform(6, 10), 0.30),
    ],
    "hoe": [
        *COMMON_BONUS,
        ("minecraft:efficiency", uniform(6, 10), 0.30),
    ],
    "helmet": [
        *COMMON_BONUS,
        ("minecraft:protection", uniform(5, 10), 0.30),
        ("minecraft:thorns", uniform(4, 10), 0.30),
        ("minecraft:respiration", uniform(4, 10), 0.30),
        ("minecraft:aqua_affinity", 3, 0.20),
        ("overlimit:clairvoyance", 1, 0.30),
        ("overlimit:midas_table", 1, 0.30),
    ],
    "chestplate": [
        *COMMON_BONUS,
        ("minecraft:protection", uniform(5, 10), 0.30),
        ("minecraft:thorns", uniform(4, 10), 0.30),
        ("overlimit:absolute_field", 1, 0.30),
    ],
    "leggings": [
        *COMMON_BONUS,
        ("minecraft:protection", uniform(5, 10), 0.30),
        ("minecraft:thorns", uniform(4, 10), 0.30),
    ],
    "boots": [
        *COMMON_BONUS,
        ("minecraft:protection", uniform(5, 10), 0.30),
        ("minecraft:thorns", uniform(4, 10), 0.30),
        ("minecraft:feather_falling", uniform(5, 10), 0.30),
        ("overlimit:sky_walk", 1, 0.30),
        ("overlimit:cat_foot", 1, 0.30),
    ],
    "fishing_rod": [
        *COMMON_BONUS,
        ("minecraft:luck_of_the_sea", uniform(4, 10), 0.30),
        ("minecraft:lure", 4, 0.30),
    ],
    "bow": [
        *COMMON_BONUS,
        ("minecraft:power", uniform(6, 10), 0.30),
        ("minecraft:punch", uniform(3, 5), 0.30),
        ("overlimit:summon_wolf", 1, 0.30),
        ("overlimit:chain_bind", 1, 0.30),
    ],
    "crossbow": [
        *COMMON_BONUS,
        ("minecraft:power", uniform(6, 10), 0.30),
        ("minecraft:multishot", 5, 0.30),
        ("minecraft:quick_charge", 5, 0.30),
        ("minecraft:infinity", 1, 0.30),
        ("minecraft:punch", uniform(3, 5), 0.30),
        ("overlimit:summon_wolf", 1, 0.30),
        ("overlimit:chain_bind", 1, 0.30),
    ],
}

# (kinds, ench_a, ench_b, chance) — 独立判定だが両方当たったら一方のみ
EXCLUSIVE_PAIRS: list[tuple[frozenset[str], str, str, float]] = [
    (frozenset({"pickaxe"}), "overlimit:hyper_dig", "overlimit:smelting", 0.30),
    (
        frozenset({"sword", "axe", "spear"}),
        "overlimit:soul_taker",
        "overlimit:gluttony",
        0.30,
    ),
]


def exclusive_pair_function(ench_a: str, ench_b: str, chance: float) -> dict:
    """独立 chance ずつ。両方当たったら一方のみ（等確率）。

    P(neither)=(1-c)^2, P(each)=c*(1-c)+c^2/2。
    実装は P(any)=1-(1-c)^2 で1つだけ enchant_randomly。
    """
    p_any = 1.0 - (1.0 - chance) ** 2
    return {
        "function": "minecraft:enchant_randomly",
        "options": [ench_a, ench_b],
        "only_compatible": True,
        "conditions": [random_chance(p_any)],
    }


def _has_enchantment_filter(enchant_id: str) -> dict:
    return {
        "predicates": {
            "minecraft:enchantments": [
                {"enchantments": enchant_id, "levels": {"min": 1}}
            ]
        }
    }


def resolve_item_exclusive(ench_a: str, ench_b: str) -> dict:
    """set_enchantments は exclusive_set を見ない。両方付いていたら一方だけ残す（等確率）。"""
    return {
        "function": "minecraft:filtered",
        "item_filter": _has_enchantment_filter(ench_a),
        "on_pass": {
            "function": "minecraft:sequence",
            "functions": [
                {
                    "function": "minecraft:set_enchantments",
                    "enchantments": {ench_b: 0},
                    "add": False,
                    "conditions": [random_chance(0.5)],
                },
                {
                    "function": "minecraft:filtered",
                    "item_filter": _has_enchantment_filter(ench_b),
                    "on_pass": set_enchantments({ench_a: 0}, add=False),
                },
            ],
        },
    }


def enchant_functions(kind: str) -> list[dict]:
    """通常一式 → 消滅の呪い → 追加（各独立確率）。

    追加枠は add=False（そのエンチャントだけ上書き）。True だと
    enchant_with_levels のレベルと加算され、11+ で表記欠落・金床が高騰する。
    """
    functions: list[dict] = [
        {
            "function": "minecraft:enchant_with_levels",
            "levels": NORMAL_ENCHANT_LEVELS,
            "options": "#minecraft:on_random_loot",
            "conditions": [random_chance(NORMAL_ENCHANT_CHANCE)],
        },
        set_enchantments({"minecraft:vanishing_curse": 1}, add=False),
    ]
    for ench_id, level, chance in BONUS_ENCHANTS[kind]:
        functions.append(
            set_enchantments({ench_id: level}, add=False, chance=chance)
        )
    for kinds, ench_a, ench_b, chance in EXCLUSIVE_PAIRS:
        if kind in kinds:
            functions.append(exclusive_pair_function(ench_a, ench_b, chance))
    if kind == "pickaxe":
        functions.append(
            resolve_item_exclusive("overlimit:hyper_dig", "minecraft:efficiency")
        )
    if kind == "crossbow":
        functions.append(
            resolve_item_exclusive("minecraft:infinity", "minecraft:mending")
        )
    return functions

# (kind, item_suffix or None for fixed id, weight among kinds)
KIND_SPECS: list[tuple[str, str | None, int]] = [
    ("sword", "sword", 10),
    ("axe", "axe", 10),
    ("spear", "spear", 10),
    ("pickaxe", "pickaxe", 10),
    ("shovel", "shovel", 8),
    ("hoe", "hoe", 6),
    ("helmet", "helmet", 8),
    ("chestplate", "chestplate", 8),
    ("leggings", "leggings", 8),
    ("boots", "boots", 8),
    ("fishing_rod", None, 5),
    ("bow", None, 5),
    ("crossbow", None, 5),
]

# 本は独立種別。ウェイト 2（素材合計 100 を掛ける。弓・クロスボウは 5）。
BOOK_KIND_WEIGHT = 2
# 帰還の懐中時計。本と同じ種別ウェイト。消費アイテム（64スタック）。消滅の呪いは付けない。
WATCH_KIND_WEIGHT = 2

# CONTENT.md のカスタム（新規）エンチャント。本はここから等確率でちょうど1つ。
# バニラ強化（sharpness 6〜10 等）は本に付けない。保留（フェニックス／ドッペル／アストラル）も入れない。
BOOK_BONUS_ENCHANTS: list[tuple[str, int]] = [
    ("overlimit:apocalypse", 1),
    ("overlimit:soul_taker", 1),
    ("overlimit:void_break", 1),
    ("overlimit:hyper_gravity", 1),
    ("overlimit:summon_wolf", 1),
    ("overlimit:gluttony", 1),
    ("overlimit:necromancy", 1),
    ("overlimit:impact", 1),
    ("overlimit:chain_bind", 1),
    ("overlimit:absolute_field", 1),
    ("overlimit:clairvoyance", 1),
    ("overlimit:midas_table", 1),
    ("overlimit:sky_walk", 1),
    ("overlimit:cat_foot", 1),
    ("overlimit:hyper_dig", 1),
    ("overlimit:smelting", 1),
    ("overlimit:wind_blessing", 1),
]


def build_bonus_book() -> dict:
    """消滅の呪い必須 + カスタムエンチャントから等確率で1つ。通常一式は付けない。"""
    entries: list[dict] = []
    for ench_id, level in BOOK_BONUS_ENCHANTS:
        entries.append(
            {
                "type": "minecraft:item",
                "name": "minecraft:enchanted_book",
                "weight": 1,
                "functions": [
                    set_enchantments({"minecraft:vanishing_curse": 1}, add=False),
                    set_enchantments({ench_id: level}, add=False),
                ],
            }
        )
    return {
        "type": "minecraft:chest",
        "pools": [
            {
                "rolls": 1.0,
                "entries": entries,
            }
        ],
    }


def build_blood_moon_book() -> dict:
    """消滅の呪い + カスタム2つ。同じIDや排他ペアは付けない。"""
    exclusive = {frozenset({a, b}) for _, a, b, _ in EXCLUSIVE_PAIRS}
    ids = [ench_id for ench_id, _ in BOOK_BONUS_ENCHANTS]
    entries: list[dict] = []
    for a, b in combinations(ids, 2):
        if frozenset({a, b}) in exclusive:
            continue
        entries.append(
            {
                "type": "minecraft:item",
                "name": "minecraft:enchanted_book",
                "weight": 1,
                "functions": [
                    {
                        "function": "minecraft:set_components",
                        "components": {
                            "minecraft:stored_enchantments": {
                                "minecraft:vanishing_curse": 1,
                                a: 1,
                                b: 1,
                            }
                        },
                    }
                ],
            }
        )
    return {
        "type": "minecraft:chest",
        "pools": [
            {
                "rolls": 1,
                "entries": entries,
            }
        ],
    }


def recall_watch_components() -> dict:
    return {
        "minecraft:item_name": {"text": "帰還の懐中時計", "color": "gold"},
        "minecraft:lore": [
            {
                "text": "使用すると1つ消費し、リスポーン地点へテレポートする",
                "color": "gray",
                "italic": False,
            }
        ],
        "minecraft:rarity": "rare",
        "minecraft:max_stack_size": 64,
        "minecraft:enchantment_glint_override": True,
        "minecraft:custom_data": {"overlimit": {"recall_watch": True}},
        "minecraft:consumable": {
            "consume_seconds": 0.0,
            "animation": "none",
            "has_consume_particles": False,
            "sound": "minecraft:item.chorus_fruit.teleport",
        },
        "minecraft:use_cooldown": {
            "seconds": 1.0,
            "cooldown_group": "overlimit:recall_watch",
        },
    }


def build_recall_watch() -> dict:
    """時計見た目。右クリックで1つ消費してリスポーン地点へ。消滅の呪いは付けない。"""
    return {
        "type": "minecraft:chest",
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:item",
                        "name": "minecraft:clock",
                        "functions": [
                            {
                                "function": "minecraft:set_components",
                                "components": recall_watch_components(),
                            }
                        ],
                    }
                ],
            }
        ],
    }


def build_blood_moon_reward() -> dict:
    """本は必ず1冊。帰還の懐中時計は別枠 30%。"""
    return {
        "type": "minecraft:chest",
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:loot_table",
                        "value": "overlimit:blood_moon_book",
                    }
                ],
            },
            {
                "rolls": 1,
                "entries": [
                    {"type": "minecraft:empty", "weight": 70},
                    {
                        "type": "minecraft:loot_table",
                        "value": "overlimit:recall_watch",
                        "weight": 30,
                    },
                ],
            },
        ],
    }


def item_id(material: str, suffix: str | None, kind: str) -> str:
    if suffix is None:
        return f"minecraft:{kind}"
    return f"minecraft:{material}_{suffix}"


def build_bonus_gear() -> dict:
    # Flat weighted entries (alternatives は条件フォールバック用で加重抽選ではない)
    # 素材付きは kind × 素材weight。釣り竿・弓・クロスボウは素材が無いので
    # 素材weight合計（100）を掛け、種別weight 7 が剣の 10 と同等の尺度になるようにする。
    material_weight_sum = sum(w for _, w in MATERIAL_WEIGHTS)
    entries: list[dict] = []
    for kind, suffix, kind_weight in KIND_SPECS:
        if suffix is None:
            entries.append(
                {
                    "type": "minecraft:item",
                    "name": item_id("iron", None, kind),
                    "weight": kind_weight * material_weight_sum,
                    "functions": enchant_functions(kind),
                }
            )
            continue
        for material, mat_weight in MATERIAL_WEIGHTS:
            entries.append(
                {
                    "type": "minecraft:item",
                    "name": item_id(material, suffix, kind),
                    "weight": kind_weight * mat_weight,
                    "functions": enchant_functions(kind),
                }
            )
    entries.append(
        {
            "type": "minecraft:loot_table",
            "value": "overlimit:bonus_book",
            "weight": BOOK_KIND_WEIGHT * material_weight_sum,
        }
    )
    entries.append(
        {
            "type": "minecraft:loot_table",
            "value": "overlimit:recall_watch",
            "weight": WATCH_KIND_WEIGHT * material_weight_sum,
        }
    )
    return {
        "type": "minecraft:chest",
        "pools": [
            {
                "rolls": 1.0,
                "entries": entries,
            }
        ],
    }


def _entry_refs_bonus(entry: dict) -> bool:
    if entry.get("value") == "overlimit:bonus_gear":
        return True
    for child in entry.get("children", []):
        if isinstance(child, dict) and _entry_refs_bonus(child):
            return True
    return False


def inject_chest(table: dict) -> dict:
    pools = list(table.get("pools", []))
    # Replace previous inject if regenerating
    pools = [
        p
        for p in pools
        if not (
            isinstance(p, dict)
            and any(
                _entry_refs_bonus(e)
                for e in p.get("entries", [])
                if isinstance(e, dict)
            )
        )
    ]
    pools.append(INJECT_POOL)
    out = dict(table)
    out["pools"] = pools
    return out


def write_json(path: Path, data: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def resolve_dnt_archive() -> Path:
    """Return path to DnT zip/jar. Uses DNT_PACK, else downloads DEFAULT_DNT_URL."""
    env = os.environ.get("DNT_PACK")
    if env:
        path = Path(env)
        if not path.is_file():
            raise SystemExit(f"DNT_PACK not found: {path}")
        return path

    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    cached = CACHE_DIR / "dungeons-and-taverns-5.3.0.zip"
    if cached.is_file():
        return cached

    url = os.environ.get("DNT_URL", DEFAULT_DNT_URL)
    print(f"downloading DnT from {url}")
    urllib.request.urlretrieve(url, cached)
    return cached


def clear_generated_dnt_outputs() -> None:
    nova = ROOT / "data/nova_structures"
    if nova.exists():
        shutil.rmtree(nova)
    chests_root = ROOT / "data/minecraft/loot_table/chests"
    for sub in ("illager_mansion", "nether_fortress", "village"):
        path = chests_root / sub
        if path.exists():
            shutil.rmtree(path)


def inject_from_archive(archive: Path, label: str) -> int:
    """Inject into every */loot_table/chests/**.json inside archive. Returns count."""
    count = 0
    with zipfile.ZipFile(archive) as zf:
        for name in zf.namelist():
            # DnT zip may nest under a folder; normalize to data/...
            idx = name.find("data/")
            if idx < 0:
                continue
            rel = name[idx:]
            m = CHEST_MEMBER_RE.match(rel)
            if not m:
                continue
            ns, chest_path = m.group(1), m.group(2)
            raw = json.loads(zf.read(name).decode("utf-8"))
            injected = inject_chest(raw)
            out = ROOT / "data" / ns / "loot_table" / f"{chest_path}.json"
            write_json(out, injected)
            print(f"injected [{label}] {ns}:{chest_path}")
            count += 1
    return count


def clear_enchantment_overrides() -> None:
    """台・司書をバニラのままにするため、max_level 上書きは置かない。"""
    ench_dir = ROOT / "data/minecraft/enchantment"
    if ench_dir.exists():
        shutil.rmtree(ench_dir)


def write_efficiency_exclusive_override(jar: zipfile.ZipFile) -> None:
    """max_level はバニラのまま。exclusive_set だけ足してハイパーディグと双方向競合にする。"""
    data = json.loads(jar.read("data/minecraft/enchantment/efficiency.json").decode())
    data["exclusive_set"] = "#overlimit:exclusive_set/efficiency_hyper_dig"
    write_json(ROOT / "data/minecraft/enchantment/efficiency.json", data)


def main() -> None:
    jar_path = Path(os.environ.get("MC_JAR", DEFAULT_JAR))
    if not jar_path.is_file():
        raise SystemExit(f"client jar not found: {jar_path}")

    dnt_path = resolve_dnt_archive()

    clear_enchantment_overrides()

    write_json(ROOT / "data/overlimit/loot_table/bonus_gear.json", build_bonus_gear())
    write_json(ROOT / "data/overlimit/loot_table/bonus_book.json", build_bonus_book())
    write_json(ROOT / "data/overlimit/loot_table/recall_watch.json", build_recall_watch())
    write_json(ROOT / "data/overlimit/loot_table/blood_moon_book.json", build_blood_moon_book())
    write_json(ROOT / "data/overlimit/loot_table/blood_moon_reward.json", build_blood_moon_reward())

    clear_generated_dnt_outputs()

    with zipfile.ZipFile(jar_path) as zf:
        write_efficiency_exclusive_override(zf)
        for chest in TARGET_CHESTS:
            inner = f"data/minecraft/loot_table/chests/{chest}.json"
            raw = json.loads(zf.read(inner).decode("utf-8"))
            injected = inject_chest(raw)
            write_json(ROOT / "data/minecraft/loot_table/chests" / f"{chest}.json", injected)
            print(f"injected [vanilla] minecraft:chests/{chest}")
        for entity in TARGET_ENTITY_LOOT:
            inner = f"data/minecraft/loot_table/entities/{entity}.json"
            raw = json.loads(zf.read(inner).decode("utf-8"))
            injected = inject_chest(raw)
            write_json(ROOT / "data/minecraft/loot_table/entities" / f"{entity}.json", injected)
            print(f"injected [vanilla] minecraft:entities/{entity}")

    dnt_count = inject_from_archive(dnt_path, "DnT")

    print(
        f"wrote bonus_gear + bonus_book + recall_watch + blood_moon_book + blood_moon_reward + "
        f"{len(TARGET_CHESTS)} vanilla chests + "
        f"{len(TARGET_ENTITY_LOOT)} entity loot + "
        f"{dnt_count} DnT chests (no enchantment max_level overrides)"
    )


if __name__ == "__main__":
    main()
