# 候補地点の近くに光源ブロックがあれば return 1。
# 予算切れは「光源あり」扱い（湧かない）。連鎖上限より湧きを減らす。
execute if score #bm_light_n overlimit.const >= #bm_light_max overlimit.const run return 1
scoreboard players add #bm_light_n overlimit.const 1
# オフセット順は near_light_aligned と同じ。Java がタグを見て 1 か 0 を返す。
execute align xyz positioned ~0.5 ~0.5 ~0.5 run return run overlimit near_light
