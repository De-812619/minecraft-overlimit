execute unless score #bm_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"text":"ブラッドムーン","color":"gold"}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"100体撃破","color":"yellow"}
tellraw @a[predicate=overlimit:in_overworld] {"text":"ブラッドムーンを押し返した。報酬のチェストが近くに出現した。","color":"gold"}
execute as @a[predicate=overlimit:in_overworld] at @s run function overlimit:blood_moon/place_reward
function overlimit:blood_moon/end
function overlimit:heat/add
