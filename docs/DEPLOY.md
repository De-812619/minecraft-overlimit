# デプロイ（検証ワールド）

編集フォルダと、ゲームが読むデータパックは **別**。  
検証は Prism **ミッションワールド**（シングル）の **新規ワールド** へコピーしてから行う。

| 役割 | パス |
| :--- | :--- |
| 編集（このリポジトリ） | `/Users/okanoueyuuichi/minecraft/datapacks/over_limit_pack` |
| ゲーム読込先 | `…/PrismLauncher/instances/ミッションワールド/minecraft/saves/新規ワールド/datapacks/over_limit_pack` |

## コピー

```bash
WS="/Users/okanoueyuuichi/minecraft/datapacks/over_limit_pack"
WORLD="/Users/okanoueyuuichi/Library/Application Support/PrismLauncher/instances/ミッションワールド/minecraft/saves/新規ワールド/datapacks/over_limit_pack"
rsync -a --delete \
  --exclude '.git' \
  --exclude '.cursor' \
  --exclude '.cache' \
  --exclude '.gitignore' \
  --exclude 'resourcepack' \
  --exclude 'scripts' \
  --exclude 'docs' \
  --exclude 'dist' \
  "$WS/" "$WORLD/"
```

リソースパック（`resourcepack/`）は datapacks ではなく Prism の `resourcepacks/` へ置く。例:

```bash
RP_SRC="/Users/okanoueyuuichi/minecraft/datapacks/over_limit_pack/resourcepack"
RP_DST="/Users/okanoueyuuichi/Library/Application Support/PrismLauncher/instances/ミッションワールド/minecraft/resourcepacks/over_limit_resources"
rsync -a --delete "$RP_SRC/" "$RP_DST/"
```

エージェント向け手順は `.cursor/skills/overlimit-deploy/SKILL.md`（`parent_quest_pack` の `quest-deploy` と同型）。

配布用 zip は検証コピーとは別。`python3 scripts/pack_release.py`（出力 `dist/over_limit_pack.zip`）。手順は `.cursor/skills/overlimit-release/SKILL.md`。フォルダと zip を同じ `datapacks/` に置かない。リソースパックは別 zip／別フォルダとして配布する。

## 反映後

1. ゲーム内で `/reload`
2. 確認手順は [TESTING.md](./TESTING.md)
3. DnT 併用時は本パックを DnT より後に置く
