execute unless score #no_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 70 20
title @a[predicate=overlimit:in_overworld] title {"translate": "overlimit.event.nether_overflow","color":"gold","bold":true}
title @a[predicate=overlimit:in_overworld] subtitle {"translate": "overlimit.subtitle.defend_ok","color":"yellow"}
tellraw @a[predicate=overlimit:in_overworld] {"translate": "overlimit.msg.no.victory","color":"gold"}
execute as @a[predicate=overlimit:in_overworld] run function overlimit:reward/give_xp
execute if score #no_omen overlimit.const matches 1 as @a[predicate=overlimit:in_overworld] run function overlimit:reward/give_xp
execute as @a[predicate=overlimit:in_overworld] at @s run function overlimit:nether_overflow/place_reward
function overlimit:nether_overflow/end
function overlimit:heat/add
function overlimit:pressure/sub_2
