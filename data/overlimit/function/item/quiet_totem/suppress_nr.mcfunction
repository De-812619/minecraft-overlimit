tellraw @a {"translate":"overlimit.msg.quiet.nr","color":"gray","with":[{"selector":"@s","color":"aqua"}]}
title @a[predicate=overlimit:in_nether] times 10 60 20
title @a[predicate=overlimit:in_nether] title {"translate": "overlimit.event.nether_raise","color":"gold"}
title @a[predicate=overlimit:in_nether] subtitle {"translate": "overlimit.subtitle.suppressed","color":"aqua"}
execute if score #nr_active overlimit.const matches 1 run function overlimit:nether_raise/end
function overlimit:suppress/on_success_hook
tag @s add overlimit.qt_pay
schedule function overlimit:item/quiet_totem/pay_pulse 1t append
