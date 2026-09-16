#!/usr/bin/env python3
"""Rewrite datapack text components to translate keys and emit lang files."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

from i18n_catalog import STRINGS, ja_to_key

ROOT = Path(__file__).resolve().parents[1]
LANG_DIR = ROOT / "resourcepack" / "assets" / "overlimit" / "lang"
SKIP_JSON = {
    ROOT / "data" / "overlimit" / "loot_table" / "enchant_guide.json",
}

TEXT_RE = re.compile(r'"text"\s*:\s*"((?:\\.|[^"\\])*)"')
JP_RE = re.compile(r"[\u3040-\u30ff\u4e00-\u9fff]")


def unescape_json_str(raw: str) -> str:
    return json.loads(f'"{raw}"')


def emit_lang() -> None:
    LANG_DIR.mkdir(parents=True, exist_ok=True)
    ja = {k: v[0] for k, v in STRINGS.items()}
    en = {k: v[1] for k, v in STRINGS.items()}
    for name, data in (("ja_jp.json", ja), ("en_us.json", en)):
        path = LANG_DIR / name
        path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print(f"wrote {path.relative_to(ROOT)} ({len(data)} keys)")


def walk_json(obj: object, mapping: dict[str, str]) -> int:
    n = 0
    if isinstance(obj, dict):
        text = obj.get("text")
        if isinstance(text, str) and text in mapping:
            obj["translate"] = mapping[text]
            del obj["text"]
            n += 1
        for v in obj.values():
            n += walk_json(v, mapping)
    elif isinstance(obj, list):
        for v in obj:
            n += walk_json(v, mapping)
    return n


def rewrite_json_file(path: Path, mapping: dict[str, str]) -> int:
    data = json.loads(path.read_text(encoding="utf-8"))
    n = walk_json(data, mapping)
    if path.name == "pack.mcmeta" and isinstance(data, dict):
        pack = data.get("pack")
        if isinstance(pack, dict) and isinstance(pack.get("description"), str):
            desc = pack["description"]
            if desc in mapping:
                pack["description"] = {"translate": mapping[desc]}
                n += 1
    if n:
        path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return n


def rewrite_mcfunction(path: Path, mapping: dict[str, str]) -> int:
    src = path.read_text(encoding="utf-8")
    n = 0

    def repl(m: re.Match[str]) -> str:
        nonlocal n
        raw = m.group(1)
        try:
            text = unescape_json_str(raw)
        except json.JSONDecodeError:
            return m.group(0)
        key = mapping.get(text)
        if not key:
            return m.group(0)
        n += 1
        return f'"translate": "{key}"'

    out = TEXT_RE.sub(repl, src)
    if n:
        path.write_text(out, encoding="utf-8")
    return n


SCORE_HEAT = '{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"}'
SCORE_PRESS = '{"score":{"name":"#pressure","objective":"overlimit.const"}'
NBT_NO = '"overlimit:no"'
NBT_NR = '"overlimit:nr"'
NBT_CC = '"overlimit:cc"'


def patches() -> list[tuple[str, str, str]]:
    """(relative path, old substring, new substring). Applied before generic replace."""
    s = lambda k, **extra: json.dumps({"translate": k, **extra}, ensure_ascii=False)
    return [
        (
            "data/overlimit/function/pressure/add_1.mcfunction",
            'tellraw @a [{"text":"世界圧が ","color":"dark_red"},{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red","bold":true},{"text":" になった。","color":"dark_red"}]',
            'tellraw @a {"translate":"overlimit.msg.pressure.became","color":"dark_red","with":[{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red","bold":true}]}',
        ),
        (
            "data/overlimit/function/pressure/sub_2.mcfunction",
            'tellraw @a [{"text":"世界圧が ","color":"aqua"},{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"aqua","bold":true},{"text":" に下がった。","color":"aqua"}]',
            'tellraw @a {"translate":"overlimit.msg.pressure.dropped","color":"aqua","with":[{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"aqua","bold":true}]}',
        ),
        (
            "data/overlimit/function/pressure/reset.mcfunction",
            'tellraw @a [{"text":"世界圧が ","color":"gold"},{"text":"0","color":"gold","bold":true},{"text":" にリセットされた。","color":"gold"}]',
            'tellraw @a {"translate":"overlimit.msg.pressure.reset","color":"gold","with":[{"text":"0","color":"gold","bold":true}]}',
        ),
        (
            "data/overlimit/function/pressure/query.mcfunction",
            'tellraw @s [{"text":"[overlimit] 世界圧: ","color":"dark_red"},{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red"}]',
            'tellraw @s {"translate":"overlimit.cmd.pressure.query","color":"dark_red","with":[{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red"}]}',
        ),
        (
            "data/overlimit/function/pressure/force_set.mcfunction",
            'tellraw @s [{"text":"[overlimit] 世界圧を ","color":"dark_red"},{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red"},{"text":" に設定した","color":"dark_red"}]',
            'tellraw @s {"translate":"overlimit.cmd.pressure.set","color":"dark_red","with":[{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red"}]}',
        ),
        (
            "data/overlimit/function/heat/add.mcfunction",
            'tellraw @a [{"text":"脅威指数が ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold","bold":true},{"text":" になった。","color":"gold"}]',
            'tellraw @a {"translate":"overlimit.msg.heat.became","color":"gold","with":[{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold","bold":true}]}',
        ),
        (
            "data/overlimit/function/heat/sub.mcfunction",
            'tellraw @a [{"text":"脅威指数が ","color":"aqua"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"aqua","bold":true},{"text":" に下がった。","color":"aqua"}]',
            'tellraw @a {"translate":"overlimit.msg.heat.dropped","color":"aqua","with":[{"score":{"name":"#heat","objective":"overlimit.const"},"color":"aqua","bold":true}]}',
        ),
        (
            "data/overlimit/function/heat/query.mcfunction",
            'tellraw @s [{"text":"[overlimit] 脅威指数: ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"yellow"}]',
            'tellraw @s {"translate":"overlimit.cmd.heat.query","color":"gold","with":[{"score":{"name":"#heat","objective":"overlimit.const"},"color":"yellow"}]}',
        ),
        (
            "data/overlimit/function/heat/force_set.mcfunction",
            'tellraw @s [{"text":"[overlimit] 脅威指数を ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"yellow"},{"text":" に設定した","color":"gold"}]',
            'tellraw @s {"translate":"overlimit.cmd.heat.set","color":"gold","with":[{"score":{"name":"#heat","objective":"overlimit.const"},"color":"yellow"}]}',
        ),
        (
            "data/overlimit/function/blood_moon/start.mcfunction",
            'tellraw @a[predicate=overlimit:in_overworld] [{"text":"ブラッドムーンが始まった。この夜は強化された敵だけが現れる。100体倒せ。","color":"red"},{"text":" （脅威指数 ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]',
            'tellraw @a[predicate=overlimit:in_overworld] {"translate":"overlimit.msg.bm.start_heat","color":"red","with":[{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"}]}',
        ),
        (
            "data/overlimit/function/blood_moon/bossbar_name.mcfunction",
            'bossbar set overlimit:blood_moon name [{"text":"ブラッドムーン  ","color":"dark_red","bold":true},{"score":{"name":"#bm_kills","objective":"overlimit.const"},"color":"red"},{"text":"/100体","color":"red"},{"text":"  脅威指数","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"}]',
            'bossbar set overlimit:blood_moon name {"translate":"overlimit.bossbar.blood_moon","color":"dark_red","bold":true,"with":[{"score":{"name":"#bm_kills","objective":"overlimit.const"},"color":"red","bold":false},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold","bold":false}]}',
        ),
        (
            "data/overlimit/function/blood_moon/bossbar_name_set.mcfunction",
            '$bossbar set overlimit:blood_moon name [{"text":"ブラッドムーン  ","color":"dark_red","bold":true},{"text":"$(kills)","color":"red"},{"text":"/100体","color":"red"}]',
            '$bossbar set overlimit:blood_moon name {"translate":"overlimit.bossbar.blood_moon.kills","color":"dark_red","bold":true,"with":[{"text":"$(kills)","color":"red","bold":false}]}',
        ),
        (
            "data/overlimit/function/blood_world/bossbar_name.mcfunction",
            'bossbar set overlimit:blood_world name [{"text":"ブラッドムーン  ","color":"dark_red","bold":true},{"score":{"name":"#bw_kills","objective":"overlimit.const"},"color":"red"},{"text":"/100体","color":"red"}]',
            'bossbar set overlimit:blood_world name {"translate":"overlimit.bossbar.blood_moon.kills","color":"dark_red","bold":true,"with":[{"score":{"name":"#bw_kills","objective":"overlimit.const"},"color":"red","bold":false}]}',
        ),
        (
            "data/overlimit/function/nether_overflow/bossbar_name_set.mcfunction",
            '$bossbar set overlimit:nether_overflow name [{"text":"ネザーオーバーフロー  ","color":"dark_purple","bold":true},{"text":"$(phase)","color":"$(color)","bold":true},{"text":"  ","color":"white"},{"score":{"name":"#no_min","objective":"overlimit.const"},"color":"gold"},{"text":"分","color":"gold"},{"score":{"name":"#no_sec","objective":"overlimit.const"},"color":"gold"},{"text":"秒","color":"gold"},{"text":"  脅威指数","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"}]',
            '$bossbar set overlimit:nether_overflow name {"translate":"overlimit.bossbar.nether_overflow","color":"dark_purple","bold":true,"with":[{"text":"$(phase)","color":"$(color)","bold":true},{"score":{"name":"#no_min","objective":"overlimit.const"},"color":"gold","bold":false},{"score":{"name":"#no_sec","objective":"overlimit.const"},"color":"gold","bold":false},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold","bold":false}]}',
        ),
        (
            "data/overlimit/function/nether_raise/bossbar_name_set.mcfunction",
            '$bossbar set overlimit:nether_raise name [{"text":"ネザーレイズ ","color":"gold","bold":true},{"text":"$(phase)","color":"$(color)"},{"text":" 脅威指数","color":"gray"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"}]',
            '$bossbar set overlimit:nether_raise name {"translate":"overlimit.bossbar.nether_raise","color":"gold","bold":true,"with":[{"text":"$(phase)","color":"$(color)","bold":false},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold","bold":false}]}',
        ),
        (
            "data/overlimit/function/city_clamp/bossbar_name_set.mcfunction",
            '$bossbar set overlimit:city_clamp name [{"text":"シティクランプ ","color":"blue","bold":true},{"text":"$(phase)","color":"$(color)"},{"text":" 脅威指数","color":"gray"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"blue"}]',
            '$bossbar set overlimit:city_clamp name {"translate":"overlimit.bossbar.city_clamp","color":"blue","bold":true,"with":[{"text":"$(phase)","color":"$(color)","bold":false},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"blue","bold":false}]}',
        ),
        (
            "data/overlimit/function/nether_overflow/start.mcfunction",
            'tellraw @a[predicate=overlimit:in_overworld] ["",{"text":"ネザーオーバーフローが発生した。ゲートから敵が溢れ出し、守れないと周囲がネザー化する。ゲート（","color":"light_purple"},{"nbt":"gate.x","storage":"overlimit:no"},{"text":", ","color":"light_purple"},{"nbt":"gate.y","storage":"overlimit:no"},{"text":", ","color":"light_purple"},{"nbt":"gate.z","storage":"overlimit:no"},{"text":"）へ向かえ。","color":"light_purple"},{"text":" （脅威指数 ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]',
            'tellraw @a[predicate=overlimit:in_overworld] {"translate":"overlimit.msg.no.start","color":"light_purple","with":[{"nbt":"gate.x","storage":"overlimit:no"},{"nbt":"gate.y","storage":"overlimit:no"},{"nbt":"gate.z","storage":"overlimit:no"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"}]}',
        ),
        (
            "data/overlimit/function/nether_raise/start.mcfunction",
            'execute if score #nr_kind_id overlimit.const matches 1 run tellraw @a[predicate=overlimit:in_nether] ["",{"text":"ネザーレイズが始まった。要塞が蜂起している。","color":"gold"},{"text":" （","color":"yellow"},{"nbt":"target.x","storage":"overlimit:nr"},{"text":", ","color":"yellow"},{"nbt":"target.y","storage":"overlimit:nr"},{"text":", ","color":"yellow"},{"nbt":"target.z","storage":"overlimit:nr"},{"text":"）","color":"yellow"},{"text":" （脅威指数 ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]',
            'execute if score #nr_kind_id overlimit.const matches 1 run tellraw @a[predicate=overlimit:in_nether] {"translate":"overlimit.msg.nr.start_fortress","color":"gold","with":[{"nbt":"target.x","storage":"overlimit:nr","color":"yellow"},{"nbt":"target.y","storage":"overlimit:nr","color":"yellow"},{"nbt":"target.z","storage":"overlimit:nr","color":"yellow"},{"score":{"name":"#heat","objective":"overlimit.const"}}]}',
        ),
        (
            "data/overlimit/function/nether_raise/start.mcfunction",
            'execute if score #nr_kind_id overlimit.const matches 2 run tellraw @a[predicate=overlimit:in_nether] ["",{"text":"ネザーレイズが始まった。バストリオンが蜂起している。","color":"gold"},{"text":" （","color":"yellow"},{"nbt":"target.x","storage":"overlimit:nr"},{"text":", ","color":"yellow"},{"nbt":"target.y","storage":"overlimit:nr"},{"text":", ","color":"yellow"},{"nbt":"target.z","storage":"overlimit:nr"},{"text":"）","color":"yellow"},{"text":" （脅威指数 ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]',
            'execute if score #nr_kind_id overlimit.const matches 2 run tellraw @a[predicate=overlimit:in_nether] {"translate":"overlimit.msg.nr.start_bastion","color":"gold","with":[{"nbt":"target.x","storage":"overlimit:nr","color":"yellow"},{"nbt":"target.y","storage":"overlimit:nr","color":"yellow"},{"nbt":"target.z","storage":"overlimit:nr","color":"yellow"},{"score":{"name":"#heat","objective":"overlimit.const"}}]}',
        ),
        (
            "data/overlimit/function/city_clamp/start.mcfunction",
            'tellraw @a[predicate=overlimit:in_the_end] ["",{"text":"シティクランプが始まった。エンドシティがカオスに陥り、本来いない敵も現れる。","color":"blue"},{"text":" （","color":"aqua"},{"nbt":"target.x","storage":"overlimit:cc"},{"text":", ","color":"aqua"},{"nbt":"target.y","storage":"overlimit:cc"},{"text":", ","color":"aqua"},{"nbt":"target.z","storage":"overlimit:cc"},{"text":"）","color":"aqua"},{"text":" （脅威指数 ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]',
            'tellraw @a[predicate=overlimit:in_the_end] {"translate":"overlimit.msg.cc.start","color":"blue","with":[{"nbt":"target.x","storage":"overlimit:cc","color":"aqua"},{"nbt":"target.y","storage":"overlimit:cc","color":"aqua"},{"nbt":"target.z","storage":"overlimit:cc","color":"aqua"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"}]}',
        ),
        (
            "data/overlimit/function/item/holy_totem/on_use.mcfunction",
            'tellraw @a [{"selector":"@s","color":"gold"},{"text":" が聖王のトーテムで世界圧をリセットした。","color":"gray"}]',
            'tellraw @a {"translate":"overlimit.msg.holy.reset","color":"gray","with":[{"selector":"@s","color":"gold"}]}',
        ),
        (
            "data/overlimit/function/item/bm_totem/on_use.mcfunction",
            'tellraw @a [{"selector":"@s","color":"dark_red"},{"text":" が凶兆のトーテムでブラッドムーンを呼び出した。","color":"gray"}]',
            'tellraw @a {"translate":"overlimit.msg.omen_totem.used","color":"gray","with":[{"selector":"@s","color":"dark_red"}]}',
        ),
        (
            "data/overlimit/function/item/quiet_totem/suppress_bm.mcfunction",
            'tellraw @a [{"selector":"@s","color":"aqua"},{"text":" が静寂のトーテムでブラッドムーンを抑止した。","color":"gray"}]',
            'tellraw @a {"translate":"overlimit.msg.quiet.bm","color":"gray","with":[{"selector":"@s","color":"aqua"}]}',
        ),
        (
            "data/overlimit/function/item/quiet_totem/suppress_no.mcfunction",
            'tellraw @a [{"selector":"@s","color":"aqua"},{"text":" が静寂のトーテムでネザーオーバーフローを抑止した。","color":"gray"}]',
            'tellraw @a {"translate":"overlimit.msg.quiet.no","color":"gray","with":[{"selector":"@s","color":"aqua"}]}',
        ),
        (
            "data/overlimit/function/item/quiet_totem/suppress_nr.mcfunction",
            'tellraw @a [{"selector":"@s","color":"aqua"},{"text":" が静寂のトーテムでネザーレイズを抑止した。","color":"gray"}]',
            'tellraw @a {"translate":"overlimit.msg.quiet.nr","color":"gray","with":[{"selector":"@s","color":"aqua"}]}',
        ),
        (
            "data/overlimit/function/item/quiet_totem/suppress_cc.mcfunction",
            'tellraw @a [{"selector":"@s","color":"aqua"},{"text":" が静寂のトーテムでシティクランプを抑止した。","color":"gray"}]',
            'tellraw @a {"translate":"overlimit.msg.quiet.cc","color":"gray","with":[{"selector":"@s","color":"aqua"}]}',
        ),
        (
            "data/overlimit/function/trim/give_set.mcfunction",
            '$tellraw @s [{"text":"[overlimit] ","color":"gold"},{"text":"装飾テスト装備を装備: $(mat)（4部位・3でセット）","color":"gray"}]',
            '$tellraw @s [{"text":"[overlimit] ","color":"gold"},{"translate":"overlimit.cmd.trim_give","color":"gray","with":[{"text":"$(mat)"}]}]',
        ),
        (
            "data/overlimit/function/trim/debug/mod.mcfunction",
            '$execute if score #m overlimit.const matches -999 run tellraw @s [{"text":"  $(label) なし（期待あり）","color":"red"}]',
            '$execute if score #m overlimit.const matches -999 run tellraw @s {"translate":"overlimit.trim.dbg.mod.missing","color":"red","with":[{"text":"$(label)"}]}',
        ),
        (
            "data/overlimit/function/trim/debug/mod.mcfunction",
            '$execute unless score #m overlimit.const matches -999 run tellraw @s [{"text":"  $(label) ","color":"gray"},{"score":{"name":"#m","objective":"overlimit.const"},"color":"white"},{"text":" /100","color":"dark_gray"}]',
            '$execute unless score #m overlimit.const matches -999 run tellraw @s {"translate":"overlimit.trim.dbg.mod.value","color":"gray","with":[{"text":"$(label)"},{"score":{"name":"#m","objective":"overlimit.const"},"color":"white"}]}',
        ),
        (
            "data/overlimit/function/trim/debug/emerald_one.mcfunction",
            'execute if score #m overlimit.const matches -999 run tellraw @a[tag=overlimit.trim.dbg,limit=1] [{"text":"  ","color":"red"},{"selector":"@s"},{"text":" aura なし（期待 -20 /100）","color":"red"}]',
            'execute if score #m overlimit.const matches -999 run tellraw @a[tag=overlimit.trim.dbg,limit=1] [{"text":"  ","color":"red"},{"selector":"@s"},{"translate":"overlimit.trim.dbg.aura_missing","color":"red"}]',
        ),
        (
            "data/overlimit/function/trim/debug/emerald_one.mcfunction",
            'execute unless score #m overlimit.const matches -999 run tellraw @a[tag=overlimit.trim.dbg,limit=1] [{"text":"  ","color":"gray"},{"selector":"@s"},{"text":" aura ","color":"gray"},{"score":{"name":"#m","objective":"overlimit.const"}},{"text":" /100  （期待 -20）","color":"dark_gray"}]',
            'execute unless score #m overlimit.const matches -999 run tellraw @a[tag=overlimit.trim.dbg,limit=1] [{"text":"  ","color":"gray"},{"selector":"@s"},{"translate":"overlimit.trim.dbg.aura_value","color":"gray","with":[{"score":{"name":"#m","objective":"overlimit.const"}}]}]',
        ),
        (
            "data/overlimit/function/nether_raise/dbg_waypoint.mcfunction",
            'tellraw @s [{"text":"[NR-WP] 防具立ての数=","color":"gray"},{"score":{"name":"#nr_dbgn","objective":"overlimit.const"},"color":"yellow"},{"text":" 送信範囲=","color":"gray"},{"score":{"name":"#nr_dbgr","objective":"overlimit.const"},"color":"yellow"},{"text":" active=","color":"gray"},{"score":{"name":"#nr_active","objective":"overlimit.const"},"color":"yellow"}]',
            'tellraw @s {"translate":"overlimit.dbg.nr.stands","color":"gray","with":[{"score":{"name":"#nr_dbgn","objective":"overlimit.const"},"color":"yellow"},{"score":{"name":"#nr_dbgr","objective":"overlimit.const"},"color":"yellow"},{"score":{"name":"#nr_active","objective":"overlimit.const"},"color":"yellow"}]}',
        ),
        (
            "data/overlimit/function/nether_raise/dbg_waypoint.mcfunction",
            'tellraw @s [{"text":"[NR-WP] 戦場=","color":"gray"},{"nbt":"target.x","storage":"overlimit:nr","color":"aqua"},{"text":", ","color":"gray"},{"nbt":"target.y","storage":"overlimit:nr","color":"aqua"},{"text":", ","color":"gray"},{"nbt":"target.z","storage":"overlimit:nr","color":"aqua"}]',
            'tellraw @s {"translate":"overlimit.dbg.nr.target","color":"gray","with":[{"nbt":"target.x","storage":"overlimit:nr","color":"aqua"},{"nbt":"target.y","storage":"overlimit:nr","color":"aqua"},{"nbt":"target.z","storage":"overlimit:nr","color":"aqua"}]}',
        ),
        (
            "data/overlimit/function/nether_raise/dbg_waypoint.mcfunction",
            'execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint,limit=1] at @s run tellraw @a [{"text":"[NR-WP] 防具立て実位置=","color":"gray"},{"nbt":"Pos[0]","entity":"@s","color":"green"},{"text":", ","color":"gray"},{"nbt":"Pos[1]","entity":"@s","color":"green"},{"text":", ","color":"gray"},{"nbt":"Pos[2]","entity":"@s","color":"green"}]',
            'execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint,limit=1] at @s run tellraw @a {"translate":"overlimit.dbg.nr.pos","color":"gray","with":[{"nbt":"Pos[0]","entity":"@s","color":"green"},{"nbt":"Pos[1]","entity":"@s","color":"green"},{"nbt":"Pos[2]","entity":"@s","color":"green"}]}',
        ),
    ]


def expect_patches() -> list[tuple[str, str, str]]:
    rows = [
        ("iron", "overlimit.trim.iron", "overlimit.trim.dbg.expect.iron_p"),
        ("gold", "overlimit.trim.gold", "overlimit.trim.dbg.expect.gold_p"),
        ("diamond", "overlimit.trim.diamond", "overlimit.trim.dbg.expect.dia_p"),
        ("netherite", "overlimit.trim.netherite", "overlimit.trim.dbg.expect.net_p"),
        ("copper", "overlimit.trim.copper", "overlimit.trim.dbg.expect.cu_p"),
        ("redstone", "overlimit.trim.redstone", "overlimit.trim.dbg.expect.rs_p"),
        ("lapis", "overlimit.trim.lapis", "overlimit.trim.dbg.expect.lp_p"),
        ("amethyst", "overlimit.trim.amethyst", "overlimit.trim.dbg.expect.am_p"),
        ("quartz", "overlimit.trim.quartz", "overlimit.trim.dbg.expect.qz_p"),
        ("resin", "overlimit.trim.resin", "overlimit.trim.dbg.expect.re_p"),
    ]
    out: list[tuple[str, str, str]] = []
    ja_prefix = {
        "iron": "  期待 鉄部位: 防御 +0.5×",
        "gold": "  期待 金部位: 移動 +1%×",
        "diamond": "  期待 ダイヤ部位: 攻撃 +0.5×",
        "netherite": "  期待 ネザライト部位: HP +1×",
        "copper": "  期待 銅部位: 攻速 +2%×",
        "redstone": "  期待 赤石部位: スニーク +5%×",
        "lapis": "  期待 ラピス部位: 幸運 +0.25×",
        "amethyst": "  期待 アメジスト部位: 落下ダメ -8%×",
        "quartz": "  期待 クォーツ部位: 攻速 +2%×",
        "resin": "  期待 樹脂部位: 静止時のみ防御 +0.5×",
    }
    for mat, obj, key in rows:
        old = f'execute if score @s {obj} matches 1.. run tellraw @s [{{"text":"{ja_prefix[mat]}","color":"aqua"}},{{"score":{{"name":"@s","objective":"{obj}"}}}}]'
        new = f'execute if score @s {obj} matches 1.. run tellraw @s {{"translate":"{key}","color":"aqua","with":[{{"score":{{"name":"@s","objective":"{obj}"}}}}]}}'
        out.append(("data/overlimit/function/trim/debug/expect.mcfunction", old, new))
    return out


def leftover_report() -> int:
    n = 0
    roots = [ROOT / "data", ROOT / "pack.mcmeta", ROOT / "resourcepack" / "pack.mcmeta"]
    files: list[Path] = []
    for r in roots:
        if r.is_file():
            files.append(r)
        else:
            files.extend(r.rglob("*.json"))
            files.extend(r.rglob("*.mcfunction"))
    for path in files:
        if path in SKIP_JSON:
            continue
        text = path.read_text(encoding="utf-8")
        for m in TEXT_RE.finditer(text):
            try:
                s = unescape_json_str(m.group(1))
            except json.JSONDecodeError:
                continue
            if JP_RE.search(s):
                n += 1
                print(f"leftover {path.relative_to(ROOT)}: {s!r}")
    return n


def main() -> int:
    if "--lang" in sys.argv:
        ja_to_key()
        emit_lang()
        return 0
    mapping = ja_to_key()
    emit_lang()
    changed = 0
    for rel, old, new in patches() + expect_patches():
        path = ROOT / rel
        src = path.read_text(encoding="utf-8")
        if old not in src:
            print(f"patch miss: {rel}\n  {old[:120]}", file=sys.stderr)
            return 1
        path.write_text(src.replace(old, new, 1), encoding="utf-8")
        changed += 1
    print(f"applied {changed} composite patches")

    json_n = 0
    fn_n = 0
    for path in [ROOT / "pack.mcmeta", ROOT / "resourcepack" / "pack.mcmeta"]:
        json_n += rewrite_json_file(path, mapping)
    for path in (ROOT / "data").rglob("*.json"):
        if path in SKIP_JSON:
            continue
        json_n += rewrite_json_file(path, mapping)
    for path in (ROOT / "data").rglob("*.mcfunction"):
        fn_n += rewrite_mcfunction(path, mapping)
    print(f"rewrote {json_n} json text nodes, {fn_n} mcfunction text nodes")
    left = leftover_report()
    print(f"leftover Japanese text components: {left}")
    return 1 if left else 0


if __name__ == "__main__":
    raise SystemExit(main())
