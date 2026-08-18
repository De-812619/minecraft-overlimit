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

## ログの場所

| 用途 | パス |
| --- | --- |
| テストワールド | `.../PrismLauncher/instances/ミッションワールド/minecraft/logs/latest.log` |
| 編集リポジトリ | `/Users/okanoueyuuichi/minecraft/datapacks/over_limit_pack`（ゲームは読まない） |

`.cursor/` はデプロイ rsync から除外する（ワールドにスキルをコピーしない）。
