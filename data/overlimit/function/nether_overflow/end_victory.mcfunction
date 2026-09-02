execute unless score #no_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 70 20
title @a[predicate=overlimit:in_overworld] title {"text":"ネザーオーバーフロー","color":"gold","bold":true}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"防衛成功","color":"yellow"}
tellraw @a[predicate=overlimit:in_overworld] {"text":"ネザーの溢れを押し返した。報酬のチェストが近くに出現した。","color":"gold"}
execute as @a[predicate=overlimit:in_overworld] run function overlimit:reward/give_xp
execute as @a[predicate=overlimit:in_overworld] at @s run function overlimit:nether_overflow/place_reward
function overlimit:nether_overflow/end
function overlimit:heat/add
function overlimit:pressure/sub_2
