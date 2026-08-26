#!/usr/bin/env python3
"""配布用 zip を作る。データパックは pack.mcmeta + data/、リソースパックは pack.mcmeta + assets/ を直下に置く。"""

from __future__ import annotations

import argparse
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
RP_ROOT = ROOT / "resourcepack"
DEFAULT_DP_OUT = ROOT / "release" / "over_limit_pack.zip"
DEFAULT_RP_OUT = ROOT / "release" / "over_limit_resources.zip"
SKIP_NAMES = {".DS_Store"}
DP_ROOT_OPTIONAL = ("pack.png", "README.md")
RP_ROOT_OPTIONAL = ("pack.png",)


def skip(path: Path) -> bool:
    name = path.name
    return name in SKIP_NAMES or name.startswith("._")


def report(out: Path) -> None:
    with zipfile.ZipFile(out) as zf:
        infos = zf.infolist()
        files = [i for i in infos if not i.is_dir()]
        root = sorted({n.split("/", 1)[0] for n in zf.namelist() if n})
        raw = sum(i.file_size for i in files)
    packed = out.stat().st_size
    print(f"wrote {out}")
    print(f"files {len(files)}  uncompressed {raw}  zip {packed}")
    print(f"root {', '.join(root)}")


def verify_flat_pack_mcmeta(names: list[str]) -> None:
    if "pack.mcmeta" not in names:
        raise SystemExit("zip 直下に pack.mcmeta が無い（フォルダごと圧縮している）")
    nested = [
        n for n in names if n.endswith("/pack.mcmeta") or n.endswith("\\pack.mcmeta")
    ]
    if nested:
        raise SystemExit(f"pack.mcmeta がネストしている: {nested[0]}")


def build_datapack(out: Path, *, include_readme: bool) -> None:
    pack_mcmeta = ROOT / "pack.mcmeta"
    data = ROOT / "data"
    if not pack_mcmeta.is_file():
        raise SystemExit(f"missing {pack_mcmeta}")
    if not data.is_dir():
        raise SystemExit(f"missing {data}")

    out.parent.mkdir(parents=True, exist_ok=True)
    if out.exists():
        out.unlink()

    with zipfile.ZipFile(
        out, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9
    ) as zf:
        zf.write(pack_mcmeta, "pack.mcmeta")
        for name in DP_ROOT_OPTIONAL:
            if name == "README.md" and not include_readme:
                continue
            src = ROOT / name
            if src.is_file():
                zf.write(src, name)
        for path in sorted(data.rglob("*")):
            if not path.is_file() or skip(path):
                continue
            zf.write(path, path.relative_to(ROOT).as_posix())

    with zipfile.ZipFile(out) as zf:
        names = zf.namelist()
    verify_flat_pack_mcmeta(names)
    if not any(n.startswith("data/") for n in names):
        raise SystemExit("zip に data/ が無い")
    report(out)


def build_resourcepack(out: Path) -> None:
    pack_mcmeta = RP_ROOT / "pack.mcmeta"
    assets = RP_ROOT / "assets"
    if not pack_mcmeta.is_file():
        raise SystemExit(f"missing {pack_mcmeta}")
    if not assets.is_dir():
        raise SystemExit(f"missing {assets}")

    out.parent.mkdir(parents=True, exist_ok=True)
    if out.exists():
        out.unlink()

    with zipfile.ZipFile(
        out, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9
    ) as zf:
        zf.write(pack_mcmeta, "pack.mcmeta")
        for name in RP_ROOT_OPTIONAL:
            src = RP_ROOT / name
            if src.is_file():
                zf.write(src, name)
        for path in sorted(assets.rglob("*")):
            if not path.is_file() or skip(path):
                continue
            zf.write(path, path.relative_to(RP_ROOT).as_posix())

    with zipfile.ZipFile(out) as zf:
        names = zf.namelist()
    verify_flat_pack_mcmeta(names)
    if not any(n.startswith("assets/") for n in names):
        raise SystemExit("zip に assets/ が無い")
    report(out)


def resolve_out(path: Path) -> Path:
    return path if path.is_absolute() else ROOT / path


def main(argv: list[str]) -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    target = parser.add_mutually_exclusive_group()
    target.add_argument(
        "--datapack",
        action="store_true",
        help="データパック zip のみ（省略時もこれ）",
    )
    target.add_argument(
        "--resourcepack",
        action="store_true",
        help="リソースパック zip のみ",
    )
    target.add_argument(
        "--all",
        action="store_true",
        help="データパックとリソースパックの両方",
    )
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        help="出力先（--all では不可。既定: release/over_limit_pack.zip または release/over_limit_resources.zip）",
    )
    parser.add_argument(
        "--no-readme",
        action="store_true",
        help="データパック zip に README.md を入れない",
    )
    args = parser.parse_args(argv)

    do_dp = args.datapack or args.all or not (args.resourcepack or args.all)
    do_rp = args.resourcepack or args.all
    if args.datapack:
        do_dp, do_rp = True, False
    elif args.resourcepack:
        do_dp, do_rp = False, True
    elif args.all:
        do_dp, do_rp = True, True
    else:
        do_dp, do_rp = True, False

    if args.output is not None and do_dp and do_rp:
        raise SystemExit("--all と -o は同時に使えない（片方ずつ指定する）")

    if do_dp:
        out = resolve_out(args.output) if args.output else DEFAULT_DP_OUT
        build_datapack(out, include_readme=not args.no_readme)
    if do_rp:
        out = resolve_out(args.output) if args.output else DEFAULT_RP_OUT
        build_resourcepack(out)


if __name__ == "__main__":
    main(sys.argv[1:])
