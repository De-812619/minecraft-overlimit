#!/usr/bin/env python3
"""配布用データパック zip を作る。アーカイブ直下に pack.mcmeta と data/ を置く。"""

from __future__ import annotations

import argparse
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUT = ROOT / "dist" / "over_limit_pack.zip"
SKIP_NAMES = {".DS_Store"}
ROOT_OPTIONAL = ("pack.png", "README.md")


def skip(path: Path) -> bool:
    name = path.name
    return name in SKIP_NAMES or name.startswith("._")


def build(out: Path, *, include_readme: bool) -> None:
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
        for name in ROOT_OPTIONAL:
            if name == "README.md" and not include_readme:
                continue
            src = ROOT / name
            if src.is_file():
                zf.write(src, name)
        for path in sorted(data.rglob("*")):
            if not path.is_file() or skip(path):
                continue
            zf.write(path, path.relative_to(ROOT).as_posix())

    verify(out)
    report(out)


def verify(out: Path) -> None:
    with zipfile.ZipFile(out) as zf:
        names = zf.namelist()
    if "pack.mcmeta" not in names:
        raise SystemExit("zip 直下に pack.mcmeta が無い（フォルダごと圧縮している）")
    if not any(n.startswith("data/") for n in names):
        raise SystemExit("zip に data/ が無い")
    nested = [n for n in names if n.endswith("/pack.mcmeta") or n.endswith("\\pack.mcmeta")]
    if nested:
        raise SystemExit(f"pack.mcmeta がネストしている: {nested[0]}")


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


def main(argv: list[str]) -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        default=DEFAULT_OUT,
        help=f"出力先（既定: {DEFAULT_OUT}）",
    )
    parser.add_argument(
        "--no-readme",
        action="store_true",
        help="README.md を zip に入れない",
    )
    args = parser.parse_args(argv)
    out = args.output
    if not out.is_absolute():
        out = ROOT / out
    build(out, include_readme=not args.no_readme)


if __name__ == "__main__":
    main(sys.argv[1:])
