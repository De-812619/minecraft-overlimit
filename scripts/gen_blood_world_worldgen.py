#!/usr/bin/env python3
"""Copy vanilla overworld noise, shift X/Z so Blood World is not a 1:1 clone.

26.2 has no per-dimension seed (removed in 1.19). Adding a large shift to
climate/terrain noise samples a different slice of the same world seed.

Also splices nether biomes into Blood World's climate (desert/jungle/swamp/
badlands slices) so fortress and bastion can generate without touching the
vanilla Nether.
"""
from __future__ import annotations

import json
import os
import zipfile
from pathlib import Path

from overworld_biome_builder import OverworldBiomeBuilder

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

NETHER_BIOMES = [
    "nether_wastes",
    "soul_sand_valley",
    "crimson_forest",
    "warped_forest",
    "basalt_deltas",
]

NETHER_REMAP = {
    "minecraft:desert": "overlimit:nether_wastes",
    "minecraft:jungle": "overlimit:crimson_forest",
    "minecraft:sparse_jungle": "overlimit:warped_forest",
    "minecraft:bamboo_jungle": "overlimit:warped_forest",
    "minecraft:badlands": "overlimit:basalt_deltas",
    "minecraft:eroded_badlands": "overlimit:basalt_deltas",
    "minecraft:wooded_badlands": "overlimit:basalt_deltas",
    "minecraft:swamp": "overlimit:soul_sand_valley",
    "minecraft:mangrove_swamp": "overlimit:soul_sand_valley",
}

NETHER_SURFACE_BLOCKS = {
    "overlimit:nether_wastes": "minecraft:netherrack",
    "overlimit:soul_sand_valley": "minecraft:soul_sand",
    "overlimit:crimson_forest": "minecraft:crimson_nylium",
    "overlimit:warped_forest": "minecraft:warped_nylium",
    "overlimit:basalt_deltas": "minecraft:blackstone",
}


def rewrite(text: str) -> str:
    for old, new in REPLACEMENTS:
        text = text.replace(old, new)
    return text


def write_json(path: Path, obj: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, indent=2) + "\n", encoding="utf-8")


def nether_floor_rule() -> dict:
    sequence = []
    for biome, block in NETHER_SURFACE_BLOCKS.items():
        sequence.append(
            {
                "type": "minecraft:condition",
                "if_true": {"type": "minecraft:biome", "biome_is": [biome]},
                "then_run": {"type": "minecraft:block", "result_state": {"Name": block}},
            }
        )
    sequence.append({"type": "minecraft:block", "result_state": {"Name": "minecraft:netherrack"}})
    return {
        "type": "minecraft:condition",
        "if_true": {"type": "minecraft:above_preliminary_surface"},
        "then_run": {
            "type": "minecraft:condition",
            "if_true": {
                "type": "minecraft:biome",
                "biome_is": list(NETHER_SURFACE_BLOCKS),
            },
            "then_run": {
                "type": "minecraft:condition",
                "if_true": {
                    "type": "minecraft:stone_depth",
                    "add_surface_depth": True,
                    "offset": 0,
                    "secondary_depth_range": 0,
                    "surface_type": "floor",
                },
                "then_run": {"type": "minecraft:sequence", "sequence": sequence},
            },
        },
    }


def inject_nether_surface(ns: dict) -> None:
    seq = ns["surface_rule"]["sequence"]
    seq.append(nether_floor_rule())


def copy_nether_biomes(z: zipfile.ZipFile) -> None:
    dest = ROOT / "data/overlimit/worldgen/biome"
    dest.mkdir(parents=True, exist_ok=True)
    for name in NETHER_BIOMES:
        raw = z.read(f"data/minecraft/worldgen/biome/{name}.json")
        (dest / f"{name}.json").write_bytes(raw)


def write_biome_source() -> int:
    builder = OverworldBiomeBuilder()
    entries = builder.build()
    remapped = 0
    biomes = []
    for biome, params in entries:
        target = NETHER_REMAP.get(biome, biome)
        if target != biome:
            remapped += 1
        biomes.append({"biome": target, "parameters": params})
    dim = {
        "type": "overlimit:blood_world",
        "generator": {
            "type": "minecraft:noise",
            "biome_source": {"type": "minecraft:multi_noise", "biomes": biomes},
            "settings": "overlimit:blood_world",
        },
    }
    write_json(ROOT / "data/overlimit/dimension/blood_world.json", dim)
    return remapped


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
        ns = json.loads(rewrite(raw))
        inject_nether_surface(ns)
        write_json(ROOT / "data/overlimit/worldgen/noise_settings/blood_world.json", ns)
        copy_nether_biomes(z)

    remapped = write_biome_source()
    print(
        "wrote Blood World worldgen (shift",
        SHIFT_X,
        SHIFT_Z,
        ", nether climate slices",
        remapped,
        ")",
    )


if __name__ == "__main__":
    main()
