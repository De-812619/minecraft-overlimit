execute unless score #cc_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_the_end] times 10 70 20
title @a[predicate=overlimit:in_the_end] title {"translate": "overlimit.event.city_clamp","color":"gold","bold":true}
title @a[predicate=overlimit:in_the_end] subtitle {"translate": "overlimit.subtitle.clamp_ok","color":"yellow"}
tellraw @a[predicate=overlimit:in_the_end] {"translate": "overlimit.msg.cc.victory","color":"gold"}
execute as @a[predicate=overlimit:in_the_end] run function overlimit:reward/give_xp
execute if score #cc_omen overlimit.const matches 1 as @a[predicate=overlimit:in_the_end] run function overlimit:reward/give_xp
execute as @a[predicate=overlimit:in_the_end] at @s run function overlimit:city_clamp/place_reward
function overlimit:city_clamp/end
function overlimit:heat/add
function overlimit:pressure/sub_2
