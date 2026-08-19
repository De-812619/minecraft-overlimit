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

**出所:** [Game rule](https://minecraft.wiki/w/Game_rule) `maxCommandChainLength`

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

## 海面を陸地と誤認しない

`world_surface` は水面も拾う。`ocean_floor` との Y 差が2以上、または水ブロックなら陸地ではない。

**出所:** [Commands/execute](https://minecraft.wiki/w/Commands/execute) `positioned over` の heightmap。

---

## 金床は左スロットの上限超えを切らない

**起きたこと:** 耐久10の装備にエンチャント本を金床で付けると、耐久10のまま残った。`max_level` を上げていないので台・司書はバニラだが、金床は**新たに付ける側**だけ `max_level` で切り、既に付いている上限超えは残す。

**正しい書き方:** 金床後のアイテムは `repair_cost` が **1以上**。`data get` で値を読み、1.. のときだけ `overlimit:cap_vanilla_levels` を掛ける。`if items *[minecraft:repair_cost]` は 0（デフォルト）にも当たり、`/give` やチェスト出しを即上限へ戻してしまう。テスト付与は `/give` ではなく `set_enchantments` のルート（`/function overlimit:enchant/anvil_cap/give_test`）。

**出所:** [Anvil mechanics](https://minecraft.wiki/w/Anvil_mechanics)、[MC-273041](https://bugs.mojang.com/browse/MC-273041)（本を付けるときは上限で切る）。左スロット保持は本パックの金床確認（2026-08-20）。

---

## ログの場所

| 用途 | パス |
| --- | --- |
| テストワールド | `.../PrismLauncher/instances/ミッションワールド/minecraft/logs/latest.log` |
| 編集リポジトリ | `/Users/okanoueyuuichi/minecraft/datapacks/over_limit_pack`（ゲームは読まない） |

`.cursor/` はデプロイ rsync から除外する（ワールドにスキルをコピーしない）。
