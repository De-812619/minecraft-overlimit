#!/usr/bin/env python3
"""Copy vanilla overworld noise, shift X/Z so Blood World is not a 1:1 clone.

26.2 has no per-dimension seed (removed in 1.19). Adding a large shift to
climate/terrain noise samples a different slice of the same world seed.
"""
from __future__ import annotations

import json
import os
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_JAR = Path.home() / (
    "Library/Application Support/PrismLauncher/libraries/"
    "com/mojang/minecraft/26.2/minecraft-26.2-client.jar"
)
JAR = Path(os.environ.get("MC_JAR", DEFAULT_JAR))

SHIFT_X = 100000.0
SHIFT_Z = 70000.0

DF_NAMES = [
    "continents",
    "erosion",
    "ridges",
    "ridges_folded",
    "offset",
    "depth",
    "factor",
    "jaggedness",
    "sloped_cheese",
]

REPLACEMENTS = [
    ('"minecraft:shift_x"', '"overlimit:shift_x"'),
    ('"minecraft:shift_z"', '"overlimit:shift_z"'),
    ('"minecraft:overworld/continents"', '"overlimit:bw/continents"'),
    ('"minecraft:overworld/erosion"', '"overlimit:bw/erosion"'),
    ('"minecraft:overworld/ridges"', '"overlimit:bw/ridges"'),
    ('"minecraft:overworld/ridges_folded"', '"overlimit:bw/ridges_folded"'),
    ('"minecraft:overworld/offset"', '"overlimit:bw/offset"'),
    ('"minecraft:overworld/depth"', '"overlimit:bw/depth"'),
    ('"minecraft:overworld/factor"', '"overlimit:bw/factor"'),
    ('"minecraft:overworld/jaggedness"', '"overlimit:bw/jaggedness"'),
    ('"minecraft:overworld/sloped_cheese"', '"overlimit:bw/sloped_cheese"'),
]


def rewrite(text: str) -> str:
    for old, new in REPLACEMENTS:
        text = text.replace(old, new)
    return text


def write_json(path: Path, obj: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, indent=2) + "\n", encoding="utf-8")


def main() -> None:
    if not JAR.is_file():
        raise SystemExit(f"jar not found: {JAR}")

    df_root = ROOT / "data/overlimit/worldgen/density_function"
    write_json(
        df_root / "shift_x.json",
        {"type": "minecraft:add", "argument1": "minecraft:shift_x", "argument2": SHIFT_X},
    )
    write_json(
        df_root / "shift_z.json",
        {"type": "minecraft:add", "argument1": "minecraft:shift_z", "argument2": SHIFT_Z},
    )

    with zipfile.ZipFile(JAR) as z:
        for name in DF_NAMES:
            src = f"data/minecraft/worldgen/density_function/overworld/{name}.json"
            out = df_root / "bw" / f"{name}.json"
            out.parent.mkdir(parents=True, exist_ok=True)
            out.write_text(rewrite(z.read(src).decode()) + "\n", encoding="utf-8")

        raw = z.read("data/minecraft/worldgen/noise_settings/overworld.json").decode()
        ns_out = ROOT / "data/overlimit/worldgen/noise_settings/blood_world.json"
        ns_out.parent.mkdir(parents=True, exist_ok=True)
        ns_out.write_text(rewrite(raw) + "\n", encoding="utf-8")

    print("wrote Blood World worldgen (shift", SHIFT_X, SHIFT_Z, ")")


if __name__ == "__main__":
    main()
