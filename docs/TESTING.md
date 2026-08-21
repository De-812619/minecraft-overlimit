# テスト方法

ルート変更の確認に、未開封の構造物チェストを探す必要はない。  
変更後は **検証ワールドへデプロイ**（[DEPLOY.md](./DEPLOY.md)）→ `/reload` してから下記を使う。

## 1. `/loot` で直接出す（推奨）

ボーナス単体:

```mcfunction
/loot give @s loot overlimit:bonus_gear
```

注入済みルート全体（バニラ例）:

```mcfunction
/loot give @s loot minecraft:chests/nether_bridge
/loot give @s loot minecraft:chests/ancient_city
/loot give @s loot minecraft:chests/desert_pyramid
/loot give @s loot minecraft:chests/jungle_temple
/loot give @s loot minecraft:chests/shipwreck_treasure
/loot give @s loot minecraft:chests/underwater_ruin_big
/loot give @s loot minecraft:chests/abandoned_mineshaft
/loot give @s loot minecraft:chests/buried_treasure
/loot give @s loot minecraft:chests/trial_chambers/supply
/loot give @s loot minecraft:chests/trial_chambers/reward
/loot give @s loot minecraft:chests/trial_chambers/reward_ominous
/loot give @s loot minecraft:chests/end_city_treasure
/loot give @s loot minecraft:entities/elder_guardian
```

DnT 例:

```mcfunction
/loot give @s loot nova_structures:chests/food_supply
/loot give @s loot nova_structures:chests/illager_hideout_tresure
```

個数比率（0 / 1 / 2）や素材・エンチャントの出目を見るときは、同じコマンドを繰り返す。  
エンチャント本だけ見るとき:

```mcfunction
/loot give @s loot overlimit:bonus_book
```

本は **消滅の呪い＋カスタムエンチャントからランダム1つ**（風の加護も含む。バニラ強化は付かない）。風の加護の効果確認は `/function overlimit:enchant/give/phase4`。

帰還の懐中時計だけ見るとき:

```mcfunction
/loot give @s loot overlimit:recall_watch
```

または `/function overlimit:item/recall_watch/give`。右クリックで1つ消費し、リスポーン地点（ベッド未設定ならワールドスポーン）へ飛ぶ。64までスタックする。オフハンドに持ち替わらないこと。

## 2. 目の前のチェストを再生成

チェストの上（または隣接）に立ち、中身を消してルートを付け直す:

```mcfunction
/data merge block ~ ~-1 ~ {LootTable:"minecraft:chests/nether_bridge",Items:[]}
```

開いて確認 → 同じコマンド → 再開封、で何度でも試せる。

DnT の場合:

```mcfunction
/data merge block ~ ~-1 ~ {LootTable:"nova_structures:chests/food_supply",Items:[]}
```

チェストとの相対位置が違うときは `~ ~-1 ~` を実際の座標に合わせる。

## 3. シード固定で再現

同じ出目を再現するとき:

```mcfunction
/data merge block ~ ~-1 ~ {LootTable:"minecraft:chests/nether_bridge",LootTableSeed:1L,Items:[]}
```

比率やばらつきを見るときはシードを変えるか、シードなし（方法 2）で繰り返す。

## 4. 強化Mob（WARNING / DANGER / CRISIS）

デプロイ → `/reload` 後、敵をスポーンさせて確認する。

```mcfunction
/summon minecraft:zombie ~ ~ ~ 
```

何度か召喚し、名前（金 `WARNING` / 赤 `DANGER` / 紫 `CRISIS`）・体力・ヘルメットを見る。XP は倒してオーブ量を通常個体と比較する。

強制的に段階を付けて見るとき:

```mcfunction
/execute as @e[type=minecraft:zombie,limit=1,sort=nearest] run function overlimit:mob/make_warning
/execute as @e[type=minecraft:zombie,limit=1,sort=nearest] run function overlimit:mob/make_danger
/execute as @e[type=minecraft:zombie,limit=1,sort=nearest] run function overlimit:mob/make_crisis
```

CRISIS は体が 1.5 倍になる。既に名前があるMobや、スキャン済み（一度スポーンして判定済み）の個体は自然ロールの対象外。

XP の確認（見た目では分かりにくい。`/kill` では経験値が落ちないので、殴って倒す）:

1. ゾンビを召喚して `make_danger`（または warning / crisis）
2. サバイバルで倒す（すぐ拾わない）
3. オーブの Value を見る

```mcfunction
/data get entity @e[type=minecraft:experience_orb,limit=1,sort=nearest] Value
```

ゾンビの合計は通常 5。WARNING なら約 7、DANGER なら 50、CRISIS なら 100。DANGER / CRISIS はオーブが大きくオレンジ核になる。

## 確認の目安

| 見たいこと | 向いている方法 |
| :--- | :--- |
| ボーナス装備の中身・エンチャント | 1（`overlimit:bonus_gear`） |
| エンチャント本（消滅＋カスタム1つ） | 1（`overlimit:bonus_book`） |
| 帰還の懐中時計 | 1（`overlimit:recall_watch`） |
| 通常一式（50%）と追加（各30%）の出目 | 1 を繰り返し |
| 注入込みの全体（通常ドロップ＋ボーナス） | 1 または 2 |
| チェスト UI 上の並び | 2 |
| 同一出目の再現 | 3 |
| 強化Mob（名前・体力・ヘルメット・XP） | 4 |
| カスタムエンチャント Phase1 | 5 |
| カスタムエンチャント Phase2 | 6 |
| カスタムエンチャント Phase3 | 7 |
| カスタムエンチャント Phase4 | 8 |
| カスタムエンチャント Phase5 | 9 |
| カスタムエンチャント Phase6 | 10 |
| ブラッドムーン | 11 |
| ブラッドワールド | 12 |

## 5. カスタムエンチャント（Phase 1）

デプロイ → `/reload` 後:

効果説明の図鑑（署名済みの本。目次の水色名をクリックで各ページへ）。  
文章の正は `docs/enchant_guide.json`。直したら `python3 scripts/gen_enchant_guide.py` のあとデプロイ → `/reload`。

```mcfunction
/function overlimit:enchant/give/guide
```

```mcfunction
/function overlimit:enchant/give/phase1
```

※ 26.2 では `enchantments` は `{levels:{...}}` ではなく `{"overlimit:id":1}` 形式。関数が「不明」と出る場合は、まず `/reload`（関数パース失敗だと一覧から消える）。

| エンチャント | 確認の目安 |
| :--- | :--- |
| ヴォイドブレイク | 防具付きMobへのダメージが増える |
| アポカリプス | 近接ヒットで周囲敵が炎上＋ノックバック |
| ソウルテイカー | 剣でキル → ハート演出＋回復音 |
| 暴食 | 剣／斧キル → 食事音＋満腹回復 |
| チェインバインド | キル後、周囲敵が発光＋スロウ（雪パーティクル） |
| 絶対領域 | 近接被弾で周囲ノックバック（CD5秒） |
| アストラルフロー | **保留中**（発動無効。再開は `docs/ENCHANTS.md` A3） |
| 千里眼 | スニーク中、半径50の敵が発光 |

キル系が一度も動かないときは `/reload` 後もう一度試し、必要なら `/advancement revoke @s only overlimit:enchant/on_kill`。

個別 `/enchant @s overlimit:<id>` でも可（対応アイテムを持った状態で）。

## 6. カスタムエンチャント（Phase 2）

**新規エンチャント追加後は `/reload` だけでは不足。** カスタムエンチャントはレジストリなので、タイトルへ戻ってワールドに入り直してから実行する（`phase2` が「不明」になる典型原因）。

```mcfunction
/function overlimit:enchant/give/phase2
```

フィードバックは音・パーティクルのみ（アクションバーなし。`parent_quest_pack` と競合するため）。

| エンチャント | 確認の目安 |
| :--- | :--- |
| インパクト | 斧でMobを殴る → そのMobを中心にクリーパー風爆発（地形は壊れない）。プレイヤー以外のMobはダメージ＋ノック、自分は無傷・飛ばない。至近≈22。CD10秒（CD中は足元と斧付近に `smoke`。完了時に `crossbow.loading_end`） |
| サモン（狼） | 弓／クロスボウで敵に当てる → ヒット位置に強化狼（HP40）。寿命10秒。同一プレイヤー狼3・召喚系合計10で打ち切り |
| 精錬 | 精錬付きツルハシで鉄／金／銅／ネザー金／古代残骸を掘る → 精錬物（インゴット等／スクラップ）。幸運は乗ったうえで精錬。シルクタッチ・ハイパーディグと排他 |
| ハイパーディグ | **サバイバル**でハイパーディグ付きツールでブロックを掘り終わる → 中心の 3×3×3 も破壊（岩盤・チェスト等は除外）。おやこクエスト AoE と同じ。クリエイティブ／耐久無限は対象外 |

精錬とハイパーディグは別ピックで付与されている（同時付与不可）。

## 7. カスタムエンチャント（Phase 3）

**新規エンチャント追加後は `/reload` だけでは不足。** タイトルへ戻ってワールドに入り直してから実行する（`phase3` が「不明」になる典型原因）。

```mcfunction
/function overlimit:enchant/give/phase3
```

| エンチャント | 確認の目安 |
| :--- | :--- |
| 超重力 | 近接で敵を殴る → ヒット位置に portal 領域（3秒）。半径3の敵が中心へ引き寄せられ拘束（Slowness）。同時1領域のみ。プレイヤー・ダメージなし |
| ネクロマンシー | **タイトルへ戻って入り直し**後、ネクロ剣で名前なし敵を倒す → ヒット音のあと、倒した種の友好Mob（魂・通常の半分サイズ）が出現。WARNING／DANGER／CRISIS／ボス除外 |
| スカイウォーク | 空中でジャンプ再入力／スニーク → 即上昇＋遅延足場。再ジャンプ後は着地まで落下ダメージ無効。CD0.5秒。水中・エリトラ装備中は発動しない |

## 8. カスタムエンチャント（Phase 4）

**新規エンチャント追加後は `/reload` だけでは不足。** タイトルへ戻ってワールドに入り直してから実行する（`phase4` が「不明」になる典型原因）。

```mcfunction
/function overlimit:enchant/give/phase4
```

| エンチャント | 確認の目安 |
| :--- | :--- |
| 風の加護 | エリトラを装備して滑空中、壁衝突・矢・近接・爆発・落下ダメを受けない。地面に立っている／滑空をやめた直後は通常どおり被ダメ。`/kill` と虚空は通る。戦利品の本はカスタム抽選の1枠（当たったら金床でエリトラへ） |


## 9. カスタムエンチャント（Phase 5）

**新規エンチャント追加後は `/reload` だけでは不足。** タイトルへ戻ってワールドに入り直してから実行する（`phase5` が「不明」になる典型原因）。

```mcfunction
/function overlimit:enchant/give/phase5
```

| エンチャント | 確認の目安 |
| :--- | :--- |
| ミダスの食卓 | ヘルメットを装備してサバイバルでパン／ステーキなどを食べる → Absorption（黄ハート2個・2分）＋ Regeneration II（5秒）。満腹は食べたもののまま。ポーション・牛乳では発動しない。ケーキは対象外 |


## 10. カスタムエンチャント（Phase 6）

**新規エンチャント追加後は `/reload` だけでは不足。** タイトルへ戻ってワールドに入り直してから実行する（`phase6` が「不明」になる典型原因）。

```mcfunction
/function overlimit:enchant/give/phase6
```

| エンチャント | 確認の目安 |
| :--- | :--- |
| 猫足 | ブーツ装備で歩行が速く、**2ブロックの段差に乗れる**（4ブロックには届かない）。クリーパーを近くに出しても追いかけてこない・爆発しない（剣では倒せる）。外すと通常に戻る |


## 11. ブラッドムーン

仕様は [BLOOD_MOON.md](./BLOOD_MOON.md)。**カスタム World Clock は `/reload` では登録されない。** パックを入れたあと、タイトルへ戻ってワールドに入り直す。

デプロイ → 入り直し後:

```mcfunction
/function overlimit:blood_moon/force_start
```

時刻が夜になり、赤い霧・ボスバー「ブラッドムーン  0/100体」（ゲージは残り時間）・ベッド不可を確認する。

99体から始めて、あと1体で報酬だけ見たいとき:

```mcfunction
/function overlimit:blood_moon/force_start_99
```

任意の撃破点から始めたいとき:

```mcfunction
/function overlimit:blood_moon/force_start
/scoreboard players set #bm_kills overlimit.const 95
/function overlimit:blood_moon/bossbar_name
```

コマンド開始でも **朝（約8〜9分後）か 100体撃破** で自動終了する。朝だけ確認するなら:

```mcfunction
/time set 23460
```

```mcfunction
/summon minecraft:zombie ~ ~ ~
```

地上ではほぼ必ず WARNING / DANGER / CRISIS になり、感知が広い。スポナーの隣・試練の間では 100% にならない（通常の 16% はあり）。

開始直後に自分から **12〜16ブロックの地表（自分の高さ±4）** へ WARNING 等の強化敵が約10体出る。バニラの敵自然スポーンは止まる。以降は **約4秒ごとに最大2体**。その直前に、自分から **25ブロック以上**（または大きく高さが違う）イベント敵は消える（撃破点は増えない）。**松明などの光源ブロックから水平16ブロック以内には追加しない**。顔の前（6未満）や谷底・地下にも追加しない。撃破するとボスバーの `N/100体` が増える。**CRISISを倒すと+3**。Peaceful では追加しない。終了（または `/function overlimit:blood_moon/force_end`）で `spawn_monsters` が戻る。

報酬本だけ見るとき:

```mcfunction
/loot give @s loot overlimit:blood_moon_book
```

カスタム2つ＋消滅の呪い。同じエンチャントや排他ペア（精錬×ハイパーディグ、暴食×ソウルテイカー）は付かない。

本＋懐中時計（30%）のクリア報酬一式:

```mcfunction
/loot give @s loot overlimit:blood_moon_reward
```

発生抽選は初回30%、外れで+20%（最大100%）。現在確率は:

```mcfunction
/scoreboard players get #bm_chance overlimit.const
```

強制開始すると確率は30%に戻る。自然抽選のPityを見るときは `force_start` せず、判定日の夕方（`/time set 12000`）で確認する。

終了:

```mcfunction
/function overlimit:blood_moon/force_end
```

霧とボスバーが消え、イベント中に出した強化敵が消える。イベント前からいた WARNING は残る。

100体クリアの報酬は、オーバーワールドにいる状態でイベント産の強化敵を倒してテキストが `100/100体` になるまで。ネザーにいると出ない。**本人の隣にチェスト**（「ブラッドムーンの報酬」）。死亡中でも死亡位置に出る。本は必ず入り、帰還の懐中時計は別枠30%。本の中身だけ見るときは上の `/loot give`。


## 12. ブラッドワールド

仕様は [BLOOD_WORLD.md](./BLOOD_WORLD.md)。**ディメンション追加・World Clock 追加は `/reload` では足りない。** デプロイ後、タイトルへ戻ってワールドに入り直す（実験的設定の確認が出ることがある）。独立時計を足したあとも同様。

強制入場（ポータル不要。同じ座標）:

```mcfunction
/function overlimit:blood_world/force_enter
```

戻る:

```mcfunction
/execute in minecraft:overworld run tp @s ~ ~ ~
```

入場後、夜にしてイベントを強制開始:

```mcfunction
/function overlimit:blood_world/force_start
```

99体から報酬だけ見る:

```mcfunction
/function overlimit:blood_world/force_start_99
```

終了:

```mcfunction
/function overlimit:blood_world/force_end
```

ネザー構造物（未生成チャンク、または地形データを消して入り直したあと）:

```mcfunction
/execute in overlimit:blood_world run locate structure overlimit:bastion_remnant
```

```mcfunction
/execute in overlimit:blood_world run locate structure overlimit:fortress
```

確認すること:

- 地形がオーバーワールドと同系統（洞窟あり）。砂漠・ジャングル・沼・悪地あたりはネザーバイオーム
- バストリオンの開始高さは Y=50。ピグリンはゾンビ化せず、WARNING / DANGER / CRISIS になる
- 本ネザーの要塞・バストリオンは今までどおり
- 入場した時点で赤い霧（イベントと同じ見た目）。昼でも消えない。**ベッドは使えない**（睡眠もスポーンも不可。爆発しない）。**天気は常に晴れ**
- 夜になると抽選なしでブラッドムーン（ボスバー・睡眠不可）
- **全員がオーバーワールドにいる夜**は、ブラッドワールド側は始まらない（ボスバーも出ない）
- ブラッドワールドを空にして昼のまま待ち、入り直すと **入ったときの時刻のまま**（無人時は時計停止）
- バニラの敵自然スポーンは止まらない（`spawn_monsters` は切らない）
- 100体で本（懐中時計は30%）、朝で本なし、残敵が消える。クリア時は隣に報酬チェスト
- 全員が出るとイベント終了（報酬なし）。同じ夜に戻っても再発しない
- ポータル: 枠の中に **約4秒** 立つ（視界が歪む。**転送と同時に吐き気は消える**。途中で出るとキャンセル）。ネザーには行かない。初回到着はワールドスポーン付近±2000 の陸地（葉の上ではない）。セッション中の2人目は同じ門。全員が出るとブラッドワールド側の門が消える（自作門も含む。OW側は残る）。次の入場は前回の門±2000 の別地点。帰りはオーバーワールドの出発ゲート。手前に出る
- ベッドを右クリックすると「ブラッドワールドでは眠れない」（爆発しない）。**ディメンション属性なので `/reload` だけでは足りない**
- 地形はオーバーワールドと同じ座標のコピーではない
- オーバーワールドで `/function overlimit:blood_moon/force_start` 中にポータルへ入ると拒否される。帰りは可

すでにネザーポータルブロックが入っている古い門は、近づくと中が消える。枠を火打石で付け直す。

すでに生成済みのブラッドワールドを作り直すとき: ワールドを閉じ、`saves/新規ワールド/dimensions/overlimit/blood_world` を消して入り直す。

ポータル点火が反応しないときは、枠の内側が空気で、火打石を **泣く黒曜石** に使っているか。タイトルへ入り直したかも見る。

残課題は [BLOOD_WORLD.md](./BLOOD_WORLD.md) の「改善・確認点」。ゲートが4秒より早く感じる、海の上に建つ、`/weather` が効かない（常時晴れの副作用で検証できない）。

マルチでイベント敵が即消える場合は `overlimit.in_bw` タグ方式を確認（[BLOOD_WORLD.md](./BLOOD_WORLD.md) の「対応済み」）。2人近距離でブラッドムーン中、湧いた敵が4秒以上残ること。


## 注意

- すでに中身が確定したチェストは、ルートを付け直さない限り変わらない
- エンチャント台・司書はバニラのまま（`max_level` 上書きなし）。上限超えはチェスト付与（`set_enchantments`）側の確認になる
- 金床で本などを付けると、上限超えのバニラエンチャントはバニラ上限に戻る（耐久10→3）。カスタムと消滅の呪いは残る。プレビューは金床上では古いままに見え、取り出したあと反映されることがある

金床の確認（`/give` は使わない。26.2 の `/give` や誤判定で耐久3になる）:

```mcfunction
/function overlimit:enchant/anvil_cap/give_test
```

耐久10＋消滅の呪いの剣と、修繕の本が出る。金床で合成 → 取り出し後は耐久 III＋修繕＋消滅の呪い。未金床の剣は耐久10のまま。

- ボーナスは「通常一式 50% → 消滅の呪い → 追加各独立」の順。詳細は `docs/CONTENT.md`
- DnT ルートを試すときは、本パックが DnT より後に読み込まれていること
- カスタムエンチャントは現状 `/enchant`・テスト付与用。ボーナスルートへの組み込みは別途（`docs/ENCHANTS.md` D4）