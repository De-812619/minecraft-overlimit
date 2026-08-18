#!/usr/bin/env python3
"""docs/enchant_guide.json から図鑑ルートを生成する。"""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "docs" / "enchant_guide.json"
OUT = ROOT / "data" / "overlimit" / "loot_table" / "enchant_guide.json"
MAX_LINES = 14
TITLE_MAX = 32


def join_lines(lines: list[str] | None) -> str:
    return "\n".join(lines or [])


def link_component(
    label: str,
    page: int,
    *,
    hover: str | None = None,
    color: str = "dark_aqua",
    suffix: str = "",
) -> dict:
    comp: dict = {
        "text": f"{label}{suffix}",
        "color": color,
        "underlined": True,
        "click_event": {"action": "change_page", "page": page},
    }
    if hover:
        comp["hover_event"] = {"action": "show_text", "value": hover}
    return comp


def count_lines(parts: list[dict]) -> int:
    body = "".join(str(p.get("text", "")) for p in parts)
    if not body:
        return 0
    lines = body.split("\n")
    if body.endswith("\n"):
        return len(lines) - 1
    return len(lines)


def page_name(page: dict) -> str:
    return page.get("name") or page.get("title") or page["id"]


def build_cover(page: dict, index: dict) -> list[dict]:
    nxt = page["next"]
    sub = page.get("subheading") or []
    if isinstance(sub, str):
        sub_text = sub
    else:
        sub_text = "\n".join(sub)
    parts = [
        {"text": f"{page['heading']}\n\n", "color": "gold", "bold": True},
        {"text": f"{sub_text}\n\n", "color": "dark_red", "bold": True},
        {"text": f"{join_lines(page.get('body'))}\n\n"},
        link_component(
            nxt["label"],
            index[nxt["id"]],
            hover=nxt.get("hover"),
        ),
    ]
    return parts


def build_text(page: dict, index: dict) -> list[dict]:
    color = page.get("title_color", "dark_red")
    parts: list[dict] = [
        {"text": f"{page['title']}\n\n", "color": color, "bold": True},
        {"text": f"{join_lines(page.get('body'))}\n\n"},
    ]
    links = page.get("links") or []
    for i, link in enumerate(links):
        suffix = "\n" if i < len(links) - 1 else ""
        parts.append(
            link_component(
                link["label"],
                index[link["id"]],
                hover=link.get("hover"),
                color=link.get("color", "dark_aqua"),
                suffix=suffix,
            )
        )
    return parts


def build_toc(page: dict, pages_by_id: dict, index: dict) -> list[dict]:
    parts: list[dict] = []
    sections = page.get("sections") or []
    for s_i, section in enumerate(sections):
        heading_nl = "\n\n" if s_i == 0 and len(sections) == 1 else "\n"
        parts.append(
            {
                "text": f"{section['heading']}{heading_nl}",
                "color": "dark_red",
                "bold": True,
            }
        )
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
                link_component(
                    page_name(target),
                    index[entry_id],
                    color=target.get("toc_color", "dark_aqua"),
                    suffix=suffix,
                )
            )
    footer = page.get("footer")
    if footer:
        parts.append(
            link_component(
                footer["label"],
                index[footer["id"]],
                hover=footer.get("hover"),
                color=footer.get("color", "dark_gray"),
            )
        )
    return parts


def build_entry(page: dict, index: dict) -> list[dict]:
    parts: list[dict] = [
        {
            "text": f"{page['name']}\n",
            "color": page.get("title_color", "dark_red"),
            "bold": True,
        },
        {"text": f"{page['slot']}\n\n", "color": "dark_gray"},
        {"text": f"{join_lines(page.get('body'))}\n\n"},
    ]
    note = page.get("note")
    if note:
        parts.append({"text": f"{note}\n\n", "color": "dark_gray"})
    back = page["back"]
    parts.append(
        link_component(
            back["label"],
            index[back["id"]],
            hover=back.get("hover"),
        )
    )
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
    title = src["item"]["title"]
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
                                    "minecraft:lore": [
                                        {
                                            "text": src["item"]["lore"],
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
