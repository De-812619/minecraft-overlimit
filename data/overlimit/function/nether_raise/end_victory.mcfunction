execute unless score #nr_active overlimit.const matches 1 run return fail
function overlimit:nether_raise/mark_cleared
title @a[predicate=overlimit:in_nether] times 10 70 20
title @a[predicate=overlimit:in_nether] title {"text":"ネザーレイズ","color":"gold","bold":true}
title @a[predicate=overlimit:in_nether] subtitle {"text":"鎮圧成功","color":"yellow"}
tellraw @a[predicate=overlimit:in_nether] {"text":"要塞の蜂起を鎮圧した。報酬のチェストが近くに出現した。","color":"gold"}
execute as @a[predicate=overlimit:in_nether] at @s run function overlimit:nether_raise/place_reward
function overlimit:nether_raise/end
function overlimit:heat/add
function overlimit:pressure/sub_2
