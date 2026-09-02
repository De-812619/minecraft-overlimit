execute unless score #cc_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_the_end] times 10 70 20
title @a[predicate=overlimit:in_the_end] title {"text":"シティクランプ","color":"gold","bold":true}
title @a[predicate=overlimit:in_the_end] subtitle {"text":"鎮圧成功","color":"yellow"}
tellraw @a[predicate=overlimit:in_the_end] {"text":"エンドシティのカオスを鎮圧した。報酬のチェストが近くに出現した。","color":"gold"}
function overlimit:city_clamp/mark_cleared
execute as @a[predicate=overlimit:in_the_end] run function overlimit:reward/give_xp
execute as @a[predicate=overlimit:in_the_end] at @s run function overlimit:city_clamp/place_reward
function overlimit:city_clamp/end
function overlimit:heat/add
function overlimit:pressure/sub_2
