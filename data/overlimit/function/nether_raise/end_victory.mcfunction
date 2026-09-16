execute unless score #nr_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_nether] times 10 70 20
title @a[predicate=overlimit:in_nether] title {"translate": "overlimit.event.nether_raise","color":"gold","bold":true}
title @a[predicate=overlimit:in_nether] subtitle {"translate": "overlimit.subtitle.clamp_ok","color":"yellow"}
tellraw @a[predicate=overlimit:in_nether] {"translate": "overlimit.msg.nr.victory","color":"gold"}
execute as @a[predicate=overlimit:in_nether] run function overlimit:reward/give_xp
execute if score #nr_omen overlimit.const matches 1 as @a[predicate=overlimit:in_nether] run function overlimit:reward/give_xp
execute as @a[predicate=overlimit:in_nether] at @s run function overlimit:nether_raise/place_reward
function overlimit:nether_raise/end
function overlimit:heat/add
function overlimit:pressure/sub_2
