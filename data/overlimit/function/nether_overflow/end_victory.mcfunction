execute unless score #no_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 70 20
title @a[predicate=overlimit:in_overworld] title {"text":"ネザーオーバーフロー","color":"gold","bold":true}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"防衛成功","color":"yellow"}
tellraw @a[predicate=overlimit:in_overworld] {"text":"ネザーの溢れを押し返した。報酬がゲートに現れた。","color":"gold"}
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/place_reward
execute unless entity @e[type=minecraft:marker,tag=overlimit.no_target] run function overlimit:nether_overflow/place_reward_at with storage overlimit:no gate
function overlimit:nether_overflow/end
