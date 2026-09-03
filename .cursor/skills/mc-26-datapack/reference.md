# 26.2 メモと出所

パック本体: Java **26.2**、`pack.mcmeta` は `min_format` / `max_format` `[107, 1]`。  
検証ログ: `.../PrismLauncher/instances/ミッションワールド/minecraft/logs/latest.log`

新しい知見は「何が起きたか / 正しい書き方 / 出所」の3行で足す。推測だけの項目は入れない。

---

## `return` に値が必須

**起きたこと:** `tick_active` と `cull_one` が `/reload` でロード失敗。イベント中の毎tick（補充・朝終了・ボスバー）が動かない。

**ログ:**

```
Failed to load function overlimit:blood_moon/tick_active
Whilst parsing command on line 4: ...run return<--[HERE]
```

**正しい書き方:** `return fail` / `return 1` / `return 0` / `return run <command>`  
**誤:** `execute ... run return`

**出所:** 上記 `latest.log`（2026-08-18 22:09 / 23:11）。1.20.3 で `return` は入ったが、26.2 の関数パーサは引数なし `return` を不完全コマンドにする。

Wiki: [Function](https://minecraft.wiki/w/Function)（`return` / `return run` / `return fail`）

---

## `execute if function` と return の伝播

**起きたこと:** `near_spawner.mcfunction` が内側で `return fail` しても、親が `run function` だけだと親関数は成功のまま。`scan_blood_moon` の `if function near_spawner` が常に成功し、追加スポーンが通常ロール（84% 名無し）に落ちた。

**正しい書き方:**

```
execute align xyz positioned ~0.5 ~0.5 ~0.5 run return run function overlimit:blood_moon/near_spawner_aligned
```

関数が `return` せずに終わると **成功**。

**出所:** [Commands/function](https://minecraft.wiki/w/Commands/function)、[Execute](https://minecraft.wiki/w/Commands/execute) の `if function`（1.20.3〜）。挙動は本パックのスポナー判定＋名無しスポーンで確認。

---

## `dx` / `dy` / `dz` は直方体

**起きたこと:** `@a[distance=..25,dy=-8..8]` を「高さ差±8」のつもりで使った。Java では `dy` は直方体の辺。他軸省略は 0 なので幅1マスの柱。戦闘圏判定がほぼ当たらず、強化が通常個体になった／遠い敵のデスポーンが壊れた。

**正しい書き方:** 距離は `distance=..N`。高さ差は `Pos[1]` をスコアに入れて引き、`matches -8..8`。

**出所:** [Target selectors](https://minecraft.wiki/w/Target_selectors) — `dx, dy, dz` はヒットボックスと直方体の交差。未指定の軸は 0。範囲記法 `dy=-8..8` は Bedrock 的な「差」ではない。

関連: [MC-123441](https://bugs.mojang.com/browse/MC-123441)（体積が +1 される）

---

## `positioned over` は固体ブロックの中

**起きたこと:** 高さマップ位置で `/summon` → 壁窒息。ログ: `WARNINGは壁の中で窒息した`。同じ位置で `light.max: 7` を読むと不透明内なので常に暗い。

**正しい書き方:** 判定・召喚は `~ ~1 ~`（立てる空気）。谷底除外は高さマップ Y とプレイヤー Y の差で弾く。

**出所:** `latest.log` の窒息メッセージ。高さマップが固体 Y（`getHeight` / firstAvailable−1）であることは 26.2 の `positioned over` 実測（ブラッドムーン追加スポーン調査）。

Wiki: [Commands/execute](https://minecraft.wiki/w/Commands/execute) `positioned over`

---

## 合成光 `light.max: 7` は夕方の野外を落とす

**起きたこと:** 追加スポーンを可視光7以下にすると、開始直後（`time set 13000` / 12000〜13000）の野外でほぼ出ない。天空光がまだ落ち切っていない。

**正しい書き方（本パック）:** `#overlimit:spawn_lights` のブロック有無。溶岩・グロウライケンは入れない（野外が消える）。

**出所:** バニラ `location_check` の `light` はブロック光と天空光（skyDarken 込み）の合成。[Predicate](https://minecraft.wiki/w/Predicate) `minecraft:location_check` / light。夕方帯での全滅は本ワールドで再現。

---

## コマンド連鎖 65536

`gamerule maxCommandChainLength` デフォルト **65536**。超えたコマンドは **エラーなく切れ**、同じtickの強化スキャンやボスバー更新が飛ぶ。

半径16の立方体スキャン（33³）× 開始10方向は上限に触る。水平半径16＋Yを狭める、近いマスから `return 1`。

ネザーオーバーフローのネザー化を同じtickで半径32以上塗ると、`end`（ボスバー消去・敵デスポーン）まで届かず発生中のまま残ることがある。終了処理を先に走らせ、塗る処理は数tickに分ける。

**出所:** [Game rule](https://minecraft.wiki/w/Game_rule) `maxCommandChainLength`

---

## ネザー化の巨大キノコは `positioned over` の位置に置く

**起きたこと:** 列はすでに `positioned over motion_blocking_no_leaves`（高さマップの **1マス上＝空気／草**）で塗っている。さらに `~ ~1 ~` すると足元が空気になり、`nether_tree_base` 判定が全部落ちて木が1本も出ない。地面の `fill` は `~ ~-1 ~` が地表なので塗れる。

**正しい書き方:** ナイリウムの上にキノコを置いて `place feature minecraft:crimson_fungus_planted`（骨粉と同じ）。自前の幹＋傘は使わない。

**出所:** [Commands/execute](https://minecraft.wiki/w/Commands/execute) `positioned over` は heightmap の Y の1マス上。本パックのネザー化検証（2026-08-23）。

---

## `/summon` の NBT（26.2）

エンティティ第3引数は **NBT のまま**。ネストしたアイテムだけコンポーネント（`equipment` が旧 `ArmorItems` 相当）。

`CustomName` はテキストコンポーネント。本パックは次で WARNING 表示を確認済み:

```
data modify entity @s CustomName set value {"text":"WARNING","color":"gold","bold":true}
```

**出所:** [Entity format](https://minecraft.wiki/w/Entity_format)、[Summon](https://minecraft.wiki/w/Commands/summon)。実測: `latest.log` の `Named entity Zombie['WARNING'/...]`

---

## カスタムディメンションに別シードは無い

**起きたこと:** ブラッドワールドがオーバーワールドと同じ地形・同じ座標になった。

**正しい書き方:** 1.19 で noise generator の `seed` は削除され、全ディメンションがワールドシードを使う。別地点に見せるには `shifted_noise` の `shift_x` / `shift_z` に定数を足す（`overlimit:shift_x` / `overlimit:shift_z`）。既存チャンクは残るので、作り直すなら `dimensions/overlimit/blood_world` を消す。

**出所:** [Custom dimension](https://minecraft.wiki/w/Custom_dimension)（1.19 / 22w11a で seed 削除）、本パックの `scripts/gen_blood_world_worldgen.py`

---

## 構造物のバイオームタグはディメンションを見ない

要塞・バストリオンは `has_structure/*` のバイオームに出る。タグにバニラのネザー／浜辺バイオームを足すと本ネザーやオーバーワールドにも出る。ブラッドワールドだけ変えるなら専用バイオーム＋専用 structure set。バストリオンの高さは `start_height.absolute`（本パックは 50）。浜辺は `overlimit:beach` / `snowy_beach` に差し替え、地表ルールの biome 参照も合わせる。

**出所:** [Custom dimension](https://minecraft.wiki/w/Custom_dimension)、バニラ `worldgen/structure/bastion_remnant.json`（26.2 jar）

---

## ブラッドゲートにネザーポータル実ブロックを使わない

**起きたこと:** ゲートを `nether_portal` で埋めると、バニラのネザー転送と混ざる（OW→BW→ネザー→BW になり OW に帰れない）。

**正しい書き方:** 内側は空気。見た目は `block_display` の `nether_portal`。当たり判定は Marker の `dx/dy/dz`。転送は約80tick溜めて `nausea` ＋ `block.portal.trigger`（実ブロックのネザー転送は使わない）。

**出所:** 本パックのポータル検証（2026-08-19）。[Display](https://minecraft.wiki/w/Display) の block_display はネザーポータルを描画できる。

---

## `execute in <dim> as @a` はディメンションで絞らない

**起きたこと:** `execute in overlimit:blood_world as @a run tag @s add overlimit.in_bw` が **全プレイヤー** にタグを付けた。オーバーワールドに全員いてもブラッドワールドのブラッドムーンが始まり、ボスバー／開始メッセージも全員に出た。

`in` は実行ディメンションを変えるだけ。`@a` は全ディメンションのプレイヤーを選ぶ。

**正しい書き方:**

```
execute as @a at @s if dimension overlimit:blood_world run tag @s add overlimit.in_bw
```

**出所:** [Commands/execute](https://minecraft.wiki/w/Commands/execute) の `in` / `if dimension`。本パックの同時発生調査（2026-08-19）。

---

## クリア報酬はインベントリに入れない

**起きたこと:** 100体クリア直前の死亡で、死亡した側も生存側も本が無かった。死亡画面への `loot give` はリスポーンで消える（消滅の呪い付き）。生存側も `if dimension` / `Health` 判定で取りこぼしうる。

**正しい書き方:** 終了時にそのディメンションにいる `@a` の隣マスへチェストを置き `loot insert`。足元は踏まない。既に報酬チェストがあるマスは本を足す。置けなければ `loot spawn`。

**出所:** 本パックのクリア報酬調査（2026-08-19）。[Commands/loot](https://minecraft.wiki/w/Commands/loot) の `insert` / `spawn`。

---

## ベッドをディメンションで止める

`dimension_type` の `minecraft:gameplay/bed_rule` で `can_sleep` と `can_set_spawn` を `never` にすると、睡眠もスポーン設定もできない。`explodes` を付けなければベッドは置けるが使えない。属性変更は `/reload` では足りず、タイトルへ戻って入り直す。すでに取ったスポーンは残る。

**出所:** [Environment attribute](https://minecraft.wiki/w/Environment_attribute) `gameplay/bed_rule`（26.2 では `explodes`。26.3 で `destroy_on_use` に改名）。

---

## 海面を陸地と誤認しない

`world_surface` は水面も拾う。`ocean_floor` との Y 差が2以上、または水ブロックなら陸地ではない。

**出所:** [Commands/execute](https://minecraft.wiki/w/Commands/execute) `positioned over` の heightmap。

---

## 金床は左スロットの上限超えを切らない

**起きたこと:** 耐久10の装備にエンチャント本を金床で付けると、耐久10のまま残った。`max_level` を上げていないので台・司書はバニラだが、金床は**新たに付ける側**だけ `max_level` で切り、既に付いている上限超えは残す。

**正しい書き方:** 金床後のアイテムは `repair_cost` が **1以上**。`data get` で値を読み、1.. のときだけ `overlimit:cap_vanilla_levels` を掛ける。`if items *[minecraft:repair_cost]` は 0（デフォルト）にも当たり、`/give` やチェスト出しを即上限へ戻してしまう。テスト付与は `/give` ではなく `set_enchantments` のルート（`/function overlimit:enchant/anvil_cap/give_test`）。

**出所:** [Anvil mechanics](https://minecraft.wiki/w/Anvil_mechanics)、[MC-273041](https://bugs.mojang.com/browse/MC-273041)（本を付けるときは上限で切る）。左スロット保持は本パックの金床確認（2026-08-20）。

---

## 狼のハウリング音は 26.2 に無い

**起きたこと:** サモン狼の `playsound minecraft:entity.wolf.howl` が毎召喚でログに出る。

```
Unable to play unknown soundEvent: minecraft:entity.wolf.howl
```

**正しい書き方:** `minecraft:entity.wolf.growl`（または `entity.wolf.ambient`）。

**出所:** `latest.log`（2026-08-21）。[Sounds.json](https://minecraft.wiki/w/Sounds.json) の狼は growl / ambient / whine 等。`howl` は 26.2 のイベント名に無い。

---

## ピグリンは `AngryAt` を使わない

**起きたこと:** ネザーオーバーフローのピグリン／ブルートがオーバーワールドでその場に立ち、プレイヤーへ向かわない。ガストは敵対して動く。`IsImmuneToZombification` は効いており、ログ上も `Piglin` / `PiglinBrute` のまま死ぬ。

**正しい書き方:** Brain の `minecraft:angry_at`（`ttl` とプレイヤー UUID）を書く。対象はコア所持者ではなく、その個体から最寄の生存／アドベンチャープレイヤー（金防具でも中立にしないため。コア優先はしない）。スポーン時にそのプレイヤーをソースにした `damage ... player_attack` で Heavy aggravation を付ける。`AngryAt` / `AngerTime` だけはピグリンが読まない。呼び出しは `at @s`（`distance` を tick 原点で測らない）。

**出所:** [Piglin](https://minecraft.wiki/w/Piglin)「Unlike other neutral mobs, piglins don't count towards the AngryAt tag」、[MC-256289](https://bugs.mojang.com/browse/MC-256289)。本パックの防衛検証（2026-08-22）`latest.log` の `Named entity Piglin['WARNING'/...]`。

---

## トーテム使用音は `item.totem.use`

**起きたこと:** 聖王のトーテムのレシピ／ルートがロード失敗。クラフトできない。give もルート欠落で関数が落ちた。

**ログ:**

```
Couldn't parse data file 'overlimit:holy_totem' from 'overlimit:recipe/holy_totem.json': ... ResourceKey[minecraft:sound_event / minecraft:item.totem_use]
```

**正しい書き方:** `minecraft:item.totem.use`（ドット）。`item.totem_use` は 26.2 に無い。不明な `sound` は `consumable` ごとレシピ／ルートを落とす。

**出所:** `latest.log`（2026-08-29 22:14）。静寂のトーテムは `block.beacon.deactivate` で通っている。

---

## レシピ材料はアイテムIDだけ

**起きたこと:** 不死鳥の護符の材料が `minecraft:totem_of_undying` なので、同じIDの護符・静寂のトーテムもクラフトできた。クラフト後に取り消すと、材料は返るが結果がインベントリに残り無限作成になった。

**正しい書き方:** `Ingredient` は `HolderSet<Item>`（ID / `#tag` / 配列）。`custom_data` では材料を絞れない。作業台の結果スロットもコマンドでは消せない。レシピ材料になるカスタムアイテムは、サバイバルで手に入らないベース（本パックの静寂／聖王は `knowledge_book`）にする。見た目は `item_model`。護符はレシピ材料にならないので `poisonous_potato` のまま（致死回避は `death_protection`）。

**出所:** 26.2 `Ingredient.class` の `CODEC`（`HolderSetCodec` of `Registries.ITEM`）。[Recipe](https://minecraft.wiki/w/Recipe_(Java_Edition))。本パックの護符クラフト検証（2026-08-28）。聖王のトーテムが毒ジャガイモでレシピ本に出た件（2026-08-29）。

---

## 進捗の `requirements` は criteria と一致必須

**起きたこと:** `phoenix_amulet_craft_ing` がロード失敗。護符クラフトの材料判定が動かず、カスタムトーテムでも作れた。

**ログ:**

```
Couldn't parse data file 'overlimit:item/phoenix_amulet_craft_ing' ... Advancement completion requirements did not exactly match specified criteria. Missing: [q1, q2, q3, s1, s2, s3, p1, p2, p3]
```

**正しい書き方:** `criteria` のキーはすべて `requirements` に出す。未使用の判定用は各キーを単独配列にし、完了させないなら `minecraft:impossible` を AND で足す。

**出所:** `latest.log`（2026-08-27 23:53）。[Advancement definition](https://minecraft.wiki/w/Advancement_definition) の requirements。

---

## `waypoint modify` の色はチーム色名

**起きたこと:** `waypoint modify @s color purple` で関数がロード失敗。ロケーターバーが出ない。

**ログ:**

```
Failed to load function overlimit:nether_overflow/refresh_waypoint
Whilst parsing command on line 5: 「purple」は不明な色です ...lor purple<--[HERE]
```

**正しい書き方:** チーム色（`dark_purple` / `light_purple` / `gold` / `blue` など）。ボスバーの `color purple` とは別。hex なら `color hex RRGGBB`。

**出所:** 上記 `latest.log`（2026-08-30 00:24）。[Commands/waypoint](https://minecraft.wiki/w/Commands/waypoint)

---

## 知識の本は `consumable` を使わない

**起きたこと:** 聖王／静寂のトーテムを知識の本ベースにすると、右クリックしてもタイトル・パーティクル・世界圧リセットが走らない。`consume_item` が発火しない。`minecraft.used:minecraft.knowledge_book` も増えない。

26.2 の `KnowledgeBookItem.use` は `ConsumableComponent` を見ない。`recipes` を取った本は空リスト扱いで、先に `ItemStack.consume`（スタックを1減らすだけ。`use_remainder` も付けない）してから `FAIL` を返す。アドバンスメントも効果も飛ばず、アイテムだけ消える。

**正しい書き方:** 使用検知するアイテムは、デフォルトの `Item.use` が `consumable` に落ちるもの（本パックは毒ジャガイモ＋`!minecraft:food`）。知識の本は使わない。

**出所:** 本ワールド `latest.log`（2026-08-31 22:42、関数ロード失敗なし・使用時チャットなし）。統計 `crafted knowledge_book: 8` / `used` なし。`KnowledgeBookItem.class` の `use`（26.2 client jar）。

---

## ルートの `enchant_randomly` は排他を見ない

**起きたこと:** 構造物チェストのツルハシに幸運＋シルクタッチ＋精錬＋効率強化が同時に付いた。

26.2 の `enchant_randomly.only_compatible` は `Enchantment.canEnchant`（`supported_items`）だけ見る。既存エンチャントの `exclusive_set` は見ない。適用は `ItemStack.enchant` で上書きするだけ。`set_enchantments` も同様。

**正しい書き方:** 通常一式のあとに追加枠を足すなら、両方付いていたら一方を外す（`filtered` + レベル0）。本パックのツルハシは幸運↔シルクタッチ、精錬／ハイパーディグ↔シルクタッチ、ハイパーディグ↔効率強化。

**出所:** [Item modifier](https://minecraft.wiki/w/Item_modifier) `only_compatible`（item is listed in `supported_items`）。26.2 client jar `EnchantRandomlyFunction` の `lambda$run$1` → `canEnchant`、`enchantItem` → `ItemStack.enchant`。

---

## `hit_block` は破壊開始時だけ。tick は `at @s`

**起きたこと:** ネザライト＋ハイパーディグ＋耐久10で、3×3 が通常採掘に落ちることがある。

`hit_block` は `START_DESTROY_BLOCK` のときだけ（ブロック中心）。破壊完了は `item_durability_changed`。耐久力は Unbreaking N で N/(N+1) が不発なので、耐久10だと約9%しかアドバンスメントが走らない。保険の毎tick判定が `as @a` だけだと、実行ディメンションがオーバーワールドのままになる。

**正しい書き方:** 空気判定は `as @a at @s`。即破壊の押しっぱなしは、上書きされた current より先に prev を 3×3 する。

**出所:** 26.2 client jar `ServerPlayerGameMode.handleBlockBreakAction`（`START_DESTROY_BLOCK` → `Vec3.atCenterOf` → `EnchantmentHelper.onHitBlock`、続けて destroyProgress≥1 なら `destroyAndAck`）。

---

## `execute if weather` は無い

**起きたこと:** `overlimit:trim/copper/on_melee` が `/reload` でロード失敗。銅セットの放電が一切動かない。

```
Failed to load function overlimit:trim/copper/on_melee
Whilst parsing command on line 5: ...xecute if <--[HERE]
```

**正しい書き方:** 天候は `execute if predicate` と `minecraft:weather_check`（`thundering: true`）。`execute if weather thunder` は 26.2 の関数パーサが受けない。

**出所:** 上記 `latest.log`（2026-09-02 21:44 / 21:56）。26.2 client jar `LootItemConditions` の `weather_check`。Wiki [Predicate](https://minecraft.wiki/w/Predicate) `minecraft:weather_check`。

---

## `player_generates_container_loot` は `loot_table` 必須

**起きたこと:** `overlimit:trim/on_loot` がパース失敗。金セットの「チェストを開けたら敵対」が付かない。

```
Couldn't parse data file 'overlimit:trim/on_loot' ... 'No key loot_table in MapLike[{}]'
```

**正しい書き方:** ルート指定が要るので、空箱や任意チェストには使わない。ピグリンが怒る開扉は `minecraft:default_block_use`（26.2 にあり）＋ `#minecraft:guarded_by_piglins`。

**出所:** 上記 `latest.log`（2026-09-02 21:44）。バニラ `nether/loot_bastion.json` は各基準に `loot_table` を書く。`CriteriaTriggers.DEFAULT_BLOCK_USE`（26.2 client jar）。

---

## ピグリンは金防具以外を毎tick狙い直す

**起きたこと:** 金装飾ネザライトではピグリンが常に敵対した。Brain を消すと停止するか、次tickにまた殴る。`armor.body` の金ヘルメットは `getArmorSlots`（頭胸脚足）に入らず中立にならない。

**正しい書き方:** プレイヤー装備への `data modify ... equipment.head.id` は見た目のNBTだけ変わって ItemStack に乗らない。アーマースタンドへ `item replace` してから `id` を金ヘルメットにし、`item replace` で戻す。ネザライト頭は `item replace ... with minecraft:golden_helmet[...]` が保険。見た目は `item_model` / `equippable.asset_id`。付けた瞬間は付近ピグリンの `angry_at` だけ消す（既に追われているとバニラ金防具でも解けない）。`walk_target` は消さない。`#minecraft:piglin_safe_armor` は金防具IDのみ。チームには入れない。

**出所:** 検証（2026-09-03 16:53 / 17:05 `give_set gold` 後も攻撃）。`item replace` の装備付けは銅セットで確認済み。バニラ `data/minecraft/tags/item/piglin_safe_armor.json`。Wiki [Golden Armor](https://minecraft.wiki/w/Golden_Armor)、[Slot](https://minecraft.wiki/w/Slot) `contents` / `armor.head`。

---

## `flash` パーティクルは `color` 必須

**起きたこと:** `overlimit:trim/copper/blast` が `/reload` でロード失敗。放電の見た目も追加ダメージも出ない（呼び出し先が無い）。

```
Failed to load function overlimit:trim/copper/blast
Whilst parsing command on line 1: パーティクルの設定を解析出来ません：No key color in MapLike[{}]
```

**正しい書き方:** `particle minecraft:flash{color:[1.0,0.95,0.55,1.0]} ~ ~1 ~ 0 0 0 0 1 force`。26.2 の `flash` は色なしを受けない。

**出所:** `latest.log`（2026-09-03 16:40 / 16:41）。Wiki [Particle format](https://minecraft.wiki/w/Particle_format) — 1.21.9 で `flash` に `color` 必須。

---

## 近接直後の `/damage` は無敵時間に吸われる

**起きたこと:** 銅セットの放電が「出ない」ように見えた。`electric_spark` は雨・戦闘でほぼ見えない。同じtickの `damage ... player_attack` は直撃の HurtTime（約10tick）に阻まれ、追加5が入らない。

**正しい書き方:** 見た目は `flash` + `wax_off` + `item.trident.thunder`（`force`）。ダメージはカスタム type を `#minecraft:bypasses_cooldown` に入れる。バニラのこのタグは空。雷雨中は毎撃、晴れは8ヒットの次。ヒット1〜8は手元の小さな火花だけ。

**出所:** 検証ログ（2026-09-02 23:54 copper 付与、`/weather thunder` なし、撃破1体）。Wiki [Damage type tag](https://minecraft.wiki/w/Damage_type_tag_(Java_Edition)) `bypasses_cooldown`。

---

## ブラッドムーン開始は `weather clear`

**起きたこと:** `/weather thunder` の直後に BM を始めると雷雨が消える。銅セットの「雷雨中は毎撃放電」が検証できない。

**正しい書き方:** 雷雨テストでは BM を開始しない。BM は `blood_moon/start` で `weather clear 14000`。

**出所:** `latest.log`（2026-09-02 22:55:47 雷雨 → 22:56:09 BM 強制開始）。`data/overlimit/function/blood_moon/start.mcfunction`。

---

## ログの場所

| 用途 | パス |
| --- | --- |
| テストワールド | `.../PrismLauncher/instances/ミッションワールド/minecraft/logs/latest.log` |
| 編集リポジトリ | `/Users/okanoueyuuichi/minecraft/datapacks/over_limit_pack`（ゲームは読まない） |

`.cursor/` はデプロイ rsync から除外する（ワールドにスキルをコピーしない）。
