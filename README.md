# over_limit_pack

構造物チェストの戦利品を強化するデータパックです（Minecraft Java **26.2** / pack format **107.1**）。

既存の中身は残し、**追加プール**でオーバーリミット装備を入れます（個数比率 0:1:2 = 15:70:15）。

## 対象チェスト

### バニラ

オーバーワールドの構造物チェストは対象外。次のみボーナス装備を追加します。

| ルートテーブル | 構造物 |
| :--- | :--- |
| `chests/ancient_city` | 古代都市（例外的に OW 対象） |
| `chests/ancient_city_ice_box` | 古代都市（氷室） |
| `chests/desert_pyramid` | ピラミッド |
| `chests/jungle_temple` | ジャングル寺院 |
| `entities/elder_guardian` | 海底神殿（チェストが無いためエルダーのドロップ） |
| `chests/shipwreck_*` | 難破船（地図・補給・宝物） |
| `chests/underwater_ruin_*` | 海底遺跡 |
| `chests/abandoned_mineshaft` | 廃坑 |
| `chests/buried_treasure` | 埋もれた宝 |
| `chests/trial_chambers/entrance` ほか | 試練の間（チェスト3種） |
| `chests/trial_chambers/reward` | 試練の間（宝物庫） |
| `chests/trial_chambers/reward_ominous` | 試練の間（不吉な宝物庫） |
| `chests/nether_bridge` | ネザー要塞 |
| `chests/bastion_*` | バストリオン（4種） |
| `chests/end_city_treasure` | エンドシティ |

### Dungeons and Taverns

[Dungeons and Taverns](https://modrinth.com/datapack/dungeons-and-taverns) の **チェスト系ルート全件**（`nova_structures:chests/...` ほか）にも注入します。

本パックを **DnT より後**に読み込ませてください。

## ボーナス装備の内容

- 剣 / 斧 / 槍 / ツルハシ / シャベル / クワ
- 防具（ヘルメット・チェスト・レギンス・ブーツ）
- 釣り竿 / クロスボウ
- 帰還の懐中時計（右クリックで1つ消費してリスポーン地点へ。64スタック。消滅の呪いは付かない）
- 対象チェストごとにバニラの不死のトーテムを別枠 10%（消滅の呪いは付けない。護符クラフト用）
- 素材は **鉄・ダイヤ（同程度）・ネザライト（低）**
- 装備・本には **消滅の呪い**を必ず付与
- バニラ上限を超えるエンチャント（チェスト付与のみ。台・司書はバニラのまま。詳細は `docs/CONTENT.md`）

## クラフトアイテム

- 不死鳥の護符（不死のトーテム3つを横一列で2個。効果はトーテムと同じ。16スタック。エンチャント光沢。チェストには出ない）

## 強化Mob（WARNING / DANGER / CRISIS）

敵Mob出現時に排他ロールで強化する（WARNING 10%・DANGER 5%・CRISIS 1%）。詳細は `docs/CONTENT.md`。

## 構成

```text
over_limit_pack/
  pack.mcmeta
  data/
    overlimit/loot_table/bonus_gear.json     … ボーナス装備本体
    overlimit/recipe/phoenix_amulet.json     … 不死鳥の護符
    overlimit/function/…                     … 強化Mob など
    minecraft/loot_table/chests/…            … バニラ＋DnT の minecraft 上書き
    nova_structures/loot_table/chests/…      … DnT チェスト（注入済み）
  scripts/gen_loot.py                        … チェスト注入の再生成
  scripts/gen_enchant_guide.py               … エンチャント図鑑の再生成
  docs/CONTENT.md                            … 仕様
  docs/BLOOD_MOON.md                         … ブラッドムーン
  docs/BLOOD_WORLD.md                        … ブラッドワールド
  docs/NETHER_OVERFLOW.md                    … 拠点防衛（ネザーオーバーフロー）
  docs/enchant_guide.json                    … 図鑑本文（正）
  docs/TESTING.md                            … テスト方法
```

## 再生成

クライアント jar と DnT から対象チェストを取り込み直し、ボーナスプールを注入します。図鑑本文は `docs/enchant_guide.json` を直してから図鑑側を回します。

```bash
python3 scripts/gen_loot.py
python3 scripts/gen_enchant_guide.py
python3 scripts/gen_blood_world_worldgen.py
```

| 環境変数 | 意味 |
| :--- | :--- |
| `MC_JAR` | クライアント jar（既定: PrismLauncher の `minecraft-26.2-client.jar`） |
| `DNT_PACK` | ローカルの DnT zip/jar パス |
| `DNT_URL` | DnT のダウンロード URL（未指定時は Modrinth v5.3.0） |

## 入れ方

ワールドの `datapacks/` に本フォルダを置き、`/reload`（またはワールド再入場）します。  
**未生成のチェスト**にのみ新しいルートが効きます（既に中身が確定したチェストは変わりません）。

ルート確認の手順は `docs/TESTING.md` を参照。  
検証ワールドへのコピーは `docs/DEPLOY.md`（Prism「ミッションワールド」→「新規ワールド」）。
