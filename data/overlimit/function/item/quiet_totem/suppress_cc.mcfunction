tellraw @a {"translate":"overlimit.msg.quiet.cc","color":"gray","with":[{"selector":"@s","color":"aqua"}]}
title @a[predicate=overlimit:in_the_end] times 10 60 20
title @a[predicate=overlimit:in_the_end] title {"translate": "overlimit.event.city_clamp","color":"blue"}
title @a[predicate=overlimit:in_the_end] subtitle {"translate": "overlimit.subtitle.suppressed","color":"aqua"}
execute if score #cc_active overlimit.const matches 1 run function overlimit:city_clamp/end
function overlimit:suppress/on_success_hook
tag @s add overlimit.qt_pay
schedule function overlimit:item/quiet_totem/pay_pulse 1t append
