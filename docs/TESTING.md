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
| 通常一式（50%）と追加（各30%）の出目 | 1 を繰り返し |
| 注入込みの全体（通常ドロップ＋ボーナス） | 1 または 2 |
| チェスト UI 上の並び | 2 |
| 同一出目の再現 | 3 |
| 強化Mob（名前・体力・ヘルメット・XP） | 4 |
| カスタムエンチャント Phase1 | 5 |
| カスタムエンチャント Phase2 | 6 |
| カスタムエンチャント Phase3 | 7 |
| カスタムエンチャント Phase4 | 8 |

## 5. カスタムエンチャント（Phase 1）

デプロイ → `/reload` 後:

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


## 注意

- すでに中身が確定したチェストは、ルートを付け直さない限り変わらない
- エンチャント台・司書はバニラのまま（`max_level` 上書きなし）。上限超えはチェスト付与（`set_enchantments`）側の確認になる
- ボーナスは「通常一式 50% → 消滅の呪い → 追加各独立」の順。詳細は `docs/CONTENT.md`
- DnT ルートを試すときは、本パックが DnT より後に読み込まれていること
- カスタムエンチャントは現状 `/enchant`・テスト付与用。ボーナスルートへの組み込みは別途（`docs/ENCHANTS.md` D4）