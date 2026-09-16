#!/usr/bin/env python3
"""docs/enchant_guide.json から図鑑ルートを生成する。本文は lang キー。"""

from __future__ import annotations

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from i18n_catalog import STRINGS

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "docs" / "enchant_guide.json"
OUT = ROOT / "data" / "overlimit" / "loot_table" / "enchant_guide.json"
MAX_LINES = 14
TITLE_MAX = 32

SLOT_KEY = {
    "apocalypse": "overlimit.guide.slot.melee",
    "soul_taker": "overlimit.guide.slot.melee",
    "void_break": "overlimit.guide.slot.melee",
    "hyper_gravity": "overlimit.guide.slot.melee",
    "gluttony": "overlimit.guide.slot.melee",
    "summon_wolf": "overlimit.guide.slot.bow",
    "chain_bind": "overlimit.guide.slot.bow",
    "necromancy": "overlimit.guide.slot.sword",
    "impact": "overlimit.guide.slot.axe",
    "absolute_field": "overlimit.guide.slot.chest",
    "clairvoyance": "overlimit.guide.slot.helm",
    "midas_table": "overlimit.guide.slot.helm",
    "sky_walk": "overlimit.guide.slot.boots",
    "cat_foot": "overlimit.guide.slot.boots",
    "hyper_dig": "overlimit.guide.slot.pick",
    "smelting": "overlimit.guide.slot.pick",
    "wind_blessing": "overlimit.guide.slot.elytra",
}
TOC_HEADING = {
    "■ 武器": "overlimit.guide.toc.weapons",
    "■ 防具": "overlimit.guide.toc.armor",
    "■ ツール": "overlimit.guide.toc.tools",
    "■ エリトラ": "overlimit.guide.toc.elytra",
}
BACK_KEY = {
    "toc_weapons": "overlimit.guide.link.back_weapons",
    "toc_gear": "overlimit.guide.link.back_armor",
}
NOTE_KEY = {
    "soul_taker": "overlimit.guide.note.soul_taker",
    "gluttony": "overlimit.guide.note.gluttony",
    "hyper_dig": "overlimit.guide.note.hyper_dig",
    "smelting": "overlimit.guide.note.smelting",
}


def t(key: str, extra: list[dict] | None = None, **kwargs) -> dict:
    comp: dict = {"translate": key, **kwargs}
    if extra:
        comp["extra"] = extra
    return comp


def link_translate(
    key: str,
    page: int,
    *,
    hover_key: str | None = None,
    color: str = "dark_aqua",
    extra: list[dict] | None = None,
) -> dict:
    comp: dict = {
        "translate": key,
        "color": color,
        "underlined": True,
        "click_event": {"action": "change_page", "page": page},
    }
    if extra:
        comp["extra"] = extra
    if hover_key:
        comp["hover_event"] = {"action": "show_text", "value": {"translate": hover_key}}
    return comp


def count_lines(parts: list[dict]) -> int:
    chunks: list[str] = []

    def collect(node: object) -> None:
        if isinstance(node, dict):
            if "translate" in node:
                chunks.append(STRINGS[node["translate"]][0])
            if "text" in node:
                chunks.append(str(node["text"]))
            for extra in node.get("extra") or []:
                collect(extra)
        elif isinstance(node, list):
            for child in node:
                collect(child)

    collect(parts)
    body = "".join(chunks)
    if not body:
        return 0
    lines = body.split("\n")
    if body.endswith("\n"):
        return len(lines) - 1
    return len(lines)


def nl(suffix: str) -> list[dict] | None:
    if not suffix:
        return None
    return [{"text": suffix}]


def build_cover(page: dict, index: dict) -> list[dict]:
    parts: list[dict] = [
        t("overlimit.guide.cover.heading", color="gold", bold=True),
        t("overlimit.guide.cover.subheading", color="dark_red", bold=True),
        t("overlimit.guide.cover.body"),
        link_translate(
            "overlimit.guide.link.next",
            index[page["next"]["id"]],
            hover_key="overlimit.guide.link.next.hover",
        ),
    ]
    return parts


def build_text(page: dict, index: dict) -> list[dict]:
    parts: list[dict] = [
        t("overlimit.guide.notes.title", color=page.get("title_color", "dark_red"), bold=True),
        t("overlimit.guide.notes.body"),
        link_translate(
            "overlimit.guide.link.toc_weapons",
            index["toc_weapons"],
            hover_key="overlimit.guide.link.toc_weapons.hover",
            extra=nl("\n"),
        ),
        link_translate(
            "overlimit.guide.link.toc_gear",
            index["toc_gear"],
            hover_key="overlimit.guide.link.toc_gear.hover",
        ),
    ]
    return parts


def enchant_name_link(entry_id: str, page: int, color: str, suffix: str) -> dict:
    return {
        "translate": f"enchantment.overlimit.{entry_id}",
        "color": color,
        "underlined": True,
        "click_event": {"action": "change_page", "page": page},
        "extra": [{"text": suffix}],
    }


def build_toc(page: dict, pages_by_id: dict, index: dict) -> list[dict]:
    parts: list[dict] = []
    sections = page.get("sections") or []
    for s_i, section in enumerate(sections):
        heading_key = TOC_HEADING[section["heading"]]
        parts.append(t(heading_key, color="dark_red", bold=True))
        entries = section.get("entries") or []
        last_section = s_i == len(sections) - 1
        for e_i, entry_id in enumerate(entries):
            target = pages_by_id[entry_id]
            last_entry = e_i == len(entries) - 1
            extra_blank = last_section and last_entry and page.get("footer")
            suffix = "\n\n" if extra_blank else "\n"
            if last_section and last_entry and not page.get("footer"):
                suffix = ""
            parts.append(
                enchant_name_link(
                    entry_id,
                    index[entry_id],
                    target.get("toc_color", "dark_aqua"),
                    suffix,
                )
            )
    footer = page.get("footer")
    if footer:
        parts.append(
            link_translate(
                "overlimit.guide.link.toc_gear_short",
                index[footer["id"]],
                color=footer.get("color", "dark_gray"),
            )
        )
    return parts


def build_entry(page: dict, index: dict) -> list[dict]:
    pid = page["id"]
    back = page["back"]
    back_key = BACK_KEY[back["id"]]
    if pid in ("hyper_dig", "smelting"):
        back_key = "overlimit.guide.link.back_tools"
    if pid == "wind_blessing":
        back_key = "overlimit.guide.link.back_elytra"
    parts: list[dict] = [
        t(
            f"enchantment.overlimit.{pid}",
            extra=[{"text": "\n"}],
            color=page.get("title_color", "dark_red"),
            bold=True,
        ),
        t(SLOT_KEY[pid], color="dark_gray"),
        t(f"overlimit.guide.entry.{pid}"),
    ]
    if pid in NOTE_KEY:
        parts.append(t(NOTE_KEY[pid], color="dark_gray"))
    parts.append(link_translate(back_key, index[back["id"]]))
    return parts


BUILDERS = {
    "cover": build_cover,
    "text": build_text,
    "toc": build_toc,
    "entry": build_entry,
}


def main() -> int:
    src = json.loads(SRC.read_text(encoding="utf-8"))
    pages = src["pages"]
    ids = [p["id"] for p in pages]
    dupes = {i for i in ids if ids.count(i) > 1}
    if dupes:
        print(f"duplicate page id: {sorted(dupes)}", file=sys.stderr)
        return 1

    pages_by_id = {p["id"]: p for p in pages}
    index = {p["id"]: n for n, p in enumerate(pages, start=1)}
    title = "OverLimit"
    if len(title) > TITLE_MAX:
        print(f"item.title is {len(title)} chars (max {TITLE_MAX})", file=sys.stderr)
        return 1

    book_pages = []
    warnings: list[str] = []
    for page in pages:
        kind = page["type"]
        if kind not in BUILDERS:
            print(f"unknown type {kind!r} on {page['id']}", file=sys.stderr)
            return 1
        try:
            if kind == "toc":
                parts = build_toc(page, pages_by_id, index)
            else:
                parts = BUILDERS[kind](page, index)
        except KeyError as exc:
            print(f"{page['id']}: missing id {exc}", file=sys.stderr)
            return 1
        lines = count_lines(parts)
        if lines > MAX_LINES:
            warnings.append(f"{page['id']}: {lines} lines (book shows {MAX_LINES})")
        book_pages.append({"raw": parts})

    loot = {
        "type": "minecraft:gift",
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:item",
                        "name": "minecraft:written_book",
                        "functions": [
                            {
                                "function": "minecraft:set_components",
                                "components": {
                                    "minecraft:enchantment_glint_override": True,
                                    "minecraft:item_name": {
                                        "translate": "overlimit.guide.item.name",
                                    },
                                    "minecraft:lore": [
                                        {
                                            "translate": "overlimit.guide.item.lore",
                                            "color": "gray",
                                            "italic": False,
                                        }
                                    ],
                                    "minecraft:written_book_content": {
                                        "title": title,
                                        "author": src["item"]["author"],
                                        "generation": 0,
                                        "resolved": True,
                                        "pages": book_pages,
                                    },
                                },
                            }
                        ],
                    }
                ],
            }
        ],
    }
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(
        json.dumps(loot, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    print(f"wrote {OUT.relative_to(ROOT)} ({len(book_pages)} pages)")
    for warn in warnings:
        print(f"warning: {warn}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
