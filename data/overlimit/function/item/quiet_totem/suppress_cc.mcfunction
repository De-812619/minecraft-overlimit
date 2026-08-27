tellraw @a [{"selector":"@s","color":"aqua"},{"text":" が静寂のトーテムでシティクランプを抑止した。","color":"gray"}]
title @a[predicate=overlimit:in_the_end] times 10 60 20
title @a[predicate=overlimit:in_the_end] title {"text":"シティクランプ","color":"blue"}
title @a[predicate=overlimit:in_the_end] subtitle {"text":"抑止された","color":"aqua"}
execute if score #cc_active overlimit.const matches 1 run function overlimit:city_clamp/end
function overlimit:suppress/on_success_hook
tag @s add overlimit.qt_pay
schedule function overlimit:item/quiet_totem/pay_pulse 1t append
