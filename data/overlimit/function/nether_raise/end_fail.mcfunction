execute unless score #nr_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_nether] times 10 70 20
title @a[predicate=overlimit:in_nether] title {"translate": "overlimit.event.nether_raise","color":"dark_red","bold":true}
title @a[predicate=overlimit:in_nether] subtitle {"translate": "overlimit.subtitle.clamp_fail","color":"red"}
tellraw @a[predicate=overlimit:in_nether] {"translate": "overlimit.msg.nr.fail","color":"red"}
execute unless score #nr_fail_boost overlimit.const matches 1 run scoreboard players set #nr_fail_boost overlimit.const 1
function overlimit:nether_raise/end
function overlimit:pressure/add_1
