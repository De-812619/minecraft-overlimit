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
  "$WS/" "$WORLD/"
```

エージェント向け手順は `.cursor/skills/overlimit-deploy/SKILL.md`（`parent_quest_pack` の `quest-deploy` と同型）。

## 反映後

1. ゲーム内で `/reload`
2. 確認手順は [TESTING.md](./TESTING.md)
3. DnT 併用時は本パックを DnT より後に置く
