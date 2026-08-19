# 仕様（正）

## 目的

1. 構造物チェストの戦利品を強化する。既存の中身は残し、**追加プール**でオーバーリミット装備を足す。
2. 敵Mobの一部を **WARNING / DANGER / CRISIS** として強化する。

## 対象範囲

### バニラ

- **除外**: オーバーワールド構造物のチェスト全般
- **例外で対象**: 古代都市・ピラミッド・ジャングル寺院・海底神殿・難破船・海底遺跡・廃坑・埋もれた宝・試練の間（チェストと宝物庫）
- **対象**: ネザー要塞・バストリオン各種・エンドシティ

実装上は次のバニラルートにボーナスプールを注入する。

- `minecraft:chests/ancient_city`
- `minecraft:chests/ancient_city_ice_box`
- `minecraft:chests/desert_pyramid`
- `minecraft:chests/jungle_temple`
- `minecraft:entities/elder_guardian`（海底神殿。バニラにチェストが無いため）
- `minecraft:chests/shipwreck_map`
- `minecraft:chests/shipwreck_supply`
- `minecraft:chests/shipwreck_treasure`
- `minecraft:chests/underwater_ruin_big`
- `minecraft:chests/underwater_ruin_small`
- `minecraft:chests/abandoned_mineshaft`
- `minecraft:chests/buried_treasure`
- `minecraft:chests/trial_chambers/entrance`
- `minecraft:chests/trial_chambers/supply`
- `minecraft:chests/trial_chambers/intersection`
- `minecraft:chests/trial_chambers/reward`（通常の宝物庫）
- `minecraft:chests/trial_chambers/reward_ominous`（不吉な宝物庫）
- `minecraft:chests/nether_bridge`
- `minecraft:chests/bastion_bridge`
- `minecraft:chests/bastion_hoglin_stable`
- `minecraft:chests/bastion_other`
- `minecraft:chests/bastion_treasure`
- `minecraft:chests/end_city_treasure`

ジャングル寺院のディスペンサー（`jungle_temple_dispenser`）、考古学ルート、試練の間の樽・壺・ディスペンサー・スポナー報酬、宝物庫の入れ子テーブル（`reward_common` 等）は対象外。

### Dungeons and Taverns（DnT）

- **対象**: DnT のチェスト系ルート全件（`*/loot_table/chests/`**）
- 名前空間は主に `nova_structures`（一部 `minecraft` 上書きあり）
- 地図（`charts`）・考古学ルートは対象外

本パックは DnT のルートを上書きするため、**ワールドの datapacks 並びで本パックを DnT より後**にすること。

## ボーナス中身

毎回のチェスト生成で、追加プールから次の比率で個数を決める。


| 個数  | weight |
| --- | ------ |
| 0   | 15     |
| 1   | 70     |
| 2   | 15     |


### アイテム種別


| 種別    | アイテム                    |
| ----- | ----------------------- |
| 武器・道具 | 剣・斧・槍・ツルハシ・シャベル・クワ      |
| 防具    | ヘルメット・チェストプレート・レギンス・ブーツ |
| 本     | エンチャント本                 |
| その他   | 釣り竿・弓・クロスボウ             |


### 素材ウェイト


| 素材    | weight |
| ----- | ------ |
| 鉄     | 35     |
| ダイヤ   | 55     |
| ネザライト | 10     |


### エンチャント付与の流れ

ボーナス装備1個あたり、次の順で処理する。

1. **通常エンチャント（一式 50%）**
  アイテム全体で1回だけ判定。当たったら `enchant_with_levels`（レベル 20〜39、`#minecraft:on_random_loot`）を1回かける。  
   エンドシティ装備と同じ系統で、バニラ上限内のエンチャントが1〜複数付くことがある。エンチャントごとの50%ではない。  
   **エンチャント本はスキップ。**
2. **消滅の呪い**（`vanishing_curse` 1）を必ず付与
3. **追加エンチャント（レア）**
  - 装備: 下表の各行を独立判定。当たった枠は `set_enchantments`（`add: false`）で**そのエンチャントだけを表のレベルに上書き**する。通常枠のレベルには加算しない（加算すると 11 以上になり、`enchantment.level.13` のような欠落と金床費用の膨張が起きる）。
  - エンチャント本: 下表の**カスタム（新規）エンチャント**から**等確率でちょうど1つ**（Lv1）。バニラ強化枠（sharpness 等）は付けない。通常一式は付けない。

### 追加エンチャント（種別ごと）

各エンチャントは独立判定（付与先に載っているものだけロール）。確率は %。  
エンチャント本は下表のカスタム行から等確率で1つのみ（消滅の呪いは別途必須。本の種別ウェイトは 2）。  
カスタムはすべて Lv1 固定。**フェニックスの加護・ドッペルゲンガー・アストラルフローは保留のため対象外。**  
精錬とハイパーディグ、暴食とソウルテイカー、**ハイパーディグと効率強化**、**クロスボウの無限と修繕**は排他（両方当たった場合は一方のみ）。本は1つしか付かないので排他は不要。


| エンチャント                   | レベル  | 確率         | 主な付与先                 |
| ------------------------ | ---- | ---------- | --------------------- |
| ダメージ増加 (sharpness)       | 6〜10 | 30%        | 剣・斧・槍                 |
| 射撃ダメージ増加 (power)         | 6〜10 | 30%        | 弓・クロスボウ               |
| 水中採掘 (aqua_affinity)     | 3    | 20%        | ヘルメット                 |
| 効率強化 (efficiency)        | 6〜10 | 30%        | 斧・ツルハシ・シャベル・クワ        |
| ドロップ増加 (fortune)         | 4〜5  | 30%        | ツルハシ                  |
| 宝釣り (luck_of_the_sea)    | 4〜10 | 30%        | 釣り竿                   |
| 入れ食い (lure)              | 4    | 30%        | 釣り竿                   |
| 突進 (lunge)               | 4〜10 | 30%        | 槍                     |
| ダメージ軽減 (protection)      | 5〜10 | 30%        | 防具                    |
| 落下耐性 (feather_falling)   | 5〜10 | 30%        | ブーツ                   |
| 拡散 (multishot)           | 5    | 30%        | クロスボウ                 |
| 高速装填 (quick_charge)      | 5    | 30%        | クロスボウ                 |
| 無限 (infinity)            | 1    | 30%        | クロスボウ                 |
| パンチ (punch)              | 3〜5  | 30%        | 弓・クロスボウ               |
| 水中呼吸 (respiration)       | 4〜10 | 30%        | ヘルメット                 |
| 範囲ダメージ増加 (sweeping_edge) | 4〜10 | 30%        | 剣                     |
| 棘の鎧 (thorns)             | 4〜10 | 30%        | 防具                    |
| 耐久力 (unbreaking)         | 4〜10 | 30%        | 全装備                   |
| アポカリプス (apocalypse)      | 1    | 30%        | 剣・斧・槍                 |
| ソウルテイカー (soul_taker)     | 1    | 30%        | 剣・斧・槍                 |
| ヴォイドブレイク (void_break)    | 1    | 15%        | 剣・斧・槍                 |
| 超重力 (hyper_gravity)      | 1    | 30%        | 剣・斧・槍                 |
| サモン (summon_wolf)        | 1    | 30%        | 弓・クロスボウ               |
| 暴食 (gluttony)            | 1    | 30%        | 剣・斧・槍                 |
| ネクロマンシー (necromancy)     | 1    | 30%        | 剣                     |
| インパクト (impact)           | 1    | 30%        | 斧                     |
| チェインバインド (chain_bind)    | 1    | 30%        | 弓・クロスボウ               |
| 絶対領域 (absolute_field)    | 1    | 30%        | チェストプレート              |
| 千里眼 (clairvoyance)       | 1    | 30%        | ヘルメット                 |
| ミダスの食卓 (midas_table)     | 1    | 30%        | ヘルメット                 |
| スカイウォーク (sky_walk)       | 1    | 30%        | ブーツ                   |
| ハイパーディグ (hyper_dig)      | 1    | 30%        | ツルハシ                  |
| 精錬 (smelting)            | 1    | 30%        | ツルハシ                  |
| 風の加護 (wind_blessing)     | 1    | （本の抽選枠）    | エンチャント本のみ             |


## 強化Mob（WARNING / DANGER / CRISIS）

対象の敵Mobがワールドに初めて載ったとき（自然スポーン・スポナー・召喚・チャンクロード後の初回認識）、未処理Mobをスキャンし、下のいずれかの段階へ強化する。各Mobにつき判定は1回。同一Mobに複数段階は付かない。


| 段階      | 状態   | 備考  |
| ------- | ---- | --- |
| WARNING | 実装済み |     |
| DANGER  | 実装済み |     |
| CRISIS  | 実装済み |     |


- 既に `CustomName` があるMobは対象外（名前付きを上書きしない）
- ドラゴン・ウィザー・ウォーデンは対象外
- 対象一覧: `#overlimit:can_be_danger`
- 段階の出し分け: 各Mobにつき `0..99` を1回だけ振り、排他で当てる（合計16%が強化、84%は通常）
  - `0` → CRISIS（1%）
  - `1..5` → DANGER（5%）
  - `6..15` → WARNING（10%）
- 装備したヘルメットはドロップしない（`drop_chances.head = 0`。ネザライトの量産防止）

### WARNING Mob


| 項目  | 内容                   |
| --- | -------------------- |
| 確率  | 10%                  |
| 表示名 | `WARNING`（常時表示/オレンジ） |
| 体力  | 通常の2倍                |
| 攻撃力 | 通常                   |
| 防御力 | 通常                   |
| XP  | 通常の1.5倍              |
| その他 | 鉄ヘルメット装備             |


### DANGER Mob（エリート敵）


| 項目  | 内容                                          |
| --- | ------------------------------------------- |
| 確率  | 5%                                          |
| 表示名 | `DANGER`（常時表示）                              |
| 体力  | 通常の 4 倍（`max_health` 乗算）                    |
| 攻撃力 | 通常の 2 倍（`attack_damage` 乗算。近接向け。矢・爆発などは対象外） |
| 防御力 | `armor` を 2 倍（元が 0 のMobは実質変化なし）             |
| XP  | 死亡時に出た経験値オーブの Value を 10 倍                  |
| その他 | ダイヤヘルメット装備                                  |


### CRISIS Mob


| 項目  | 内容                                      |
| --- | --------------------------------------- |
| 確率  | 1%                                      |
| 表示名 | `CRISIS`（常時表示/紫）                        |
| 体力  | 通常の6倍                                   |
| 攻撃力 | 通常の3倍                                   |
| 防御力 | 通常の3倍                                   |
| XP  | 死亡時に出た経験値オーブの Value を 20 倍              |
| その他 | ネザライトヘルメット装備 通常のサイズより1.5倍（スポーンできる高さは考慮） |


## 実装メモ

- 名前空間: `overlimit`
- ボーナス本体: `overlimit:bonus_gear`（本は `overlimit:bonus_book`）
- 強化Mob: `overlimit:mob/*`（`#minecraft:tick` / `#minecraft:load`）。WARNING / DANGER / CRISIS は出現時の排他ロールで付与
- 対象チェスト／エルダー再生成: `scripts/gen_loot.py`
- DnT 取得: 既定で Modrinth の v5.3.0 zip（`DNT_PACK` / `DNT_URL` で上書き可）
- 上限超えエンチャントはルートの `set_enchantments`（`add: false`）でのみ付与する（エンチャント定義の `max_level` は上書きしない → **エンチャント台・司書はバニラのまま**）。例外: `minecraft:efficiency` は `max_level` を変えず、ハイパーディグとの `exclusive_set` だけ足す
- 金床で合成・修理・改名すると、上限超えの**バニラ**エンチャントは定義の `max_level` に戻る（耐久10→3など）。カスタムエンチャントと消滅の呪いは残る。チェストから出したまま（未金床）は上限超えのまま
- カスタムエンチャントの金床コスト（`anvil_cost`）は **1**（仮。複数エンチャントの合算でサバイバル上限 40＝「高すぎる！」は残る）
- 動作確認: `docs/TESTING.md`
- 検証ワールド反映: `docs/DEPLOY.md`

