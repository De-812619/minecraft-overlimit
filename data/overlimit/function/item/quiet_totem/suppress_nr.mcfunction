tellraw @a [{"selector":"@s","color":"aqua"},{"text":" が静寂のトーテムでネザーレイズを抑止した。","color":"gray"}]
title @a[predicate=overlimit:in_nether] times 10 60 20
title @a[predicate=overlimit:in_nether] title {"text":"ネザーレイズ","color":"gold"}
title @a[predicate=overlimit:in_nether] subtitle {"text":"抑止された","color":"aqua"}
execute if score #nr_active overlimit.const matches 1 run function overlimit:nether_raise/end
function overlimit:suppress/on_success_hook
tag @s add overlimit.qt_pay
schedule function overlimit:item/quiet_totem/pay_pulse 1t append
