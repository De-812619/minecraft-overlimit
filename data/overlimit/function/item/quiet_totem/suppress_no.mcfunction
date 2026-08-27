tellraw @a [{"selector":"@s","color":"aqua"},{"text":" が静寂のトーテムでネザーオーバーフローを抑止した。","color":"gray"}]
title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"text":"ネザーオーバーフロー","color":"gold"}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"抑止された","color":"aqua"}
execute if score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/netherize_finish
execute if score #no_active overlimit.const matches 1 run function overlimit:nether_overflow/end
function overlimit:suppress/on_success_hook
tag @s add overlimit.qt_pay
schedule function overlimit:item/quiet_totem/pay_pulse 1t append
