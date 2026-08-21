#!/usr/bin/env python3
"""Generate blood_moon/near_spawner_aligned.mcfunction (center-out, farms return early)."""

from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data/overlimit/function/blood_moon/near_spawner_aligned.mcfunction"
RADIUS = 4
DY = 2


def positions():
    seen: set[tuple[int, int, int]] = set()
    ordered: list[tuple[int, int, int]] = []

    def add(x: int, y: int, z: int) -> None:
        key = (x, y, z)
        if key not in seen:
            seen.add(key)
            ordered.append(key)

    ys = [0]
    for d in range(1, DY + 1):
        ys.extend((-d, d))

    for r in range(0, RADIUS + 1):
        for y in ys:
            if r == 0:
                add(0, y, 0)
                continue
            for x in range(-r, r + 1):
                for z in range(-r, r + 1):
                    if max(abs(x), abs(z)) == r:
                        add(x, y, z)
    return ordered


def main() -> None:
    lines = [
        f"# 半径 {RADIUS}・Y ±{DY}。中央から外側へ（農場はすぐヒットして return）",
    ]
    for x, y, z in positions():
        lines.append(f"execute if block ~{x} ~{y} ~{z} minecraft:spawner run return 1")
    lines.append("return fail")
    lines.append("")
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"wrote {OUT} ({len(positions())} checks)")


if __name__ == "__main__":
    main()
