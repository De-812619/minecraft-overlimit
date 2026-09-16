tellraw @a {"translate":"overlimit.msg.quiet.bm","color":"gray","with":[{"selector":"@s","color":"aqua"}]}
title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"translate": "overlimit.event.blood_moon","color":"dark_red"}
title @a[predicate=overlimit:in_overworld] subtitle {"translate": "overlimit.subtitle.suppressed","color":"aqua"}
function overlimit:blood_moon/end
function overlimit:suppress/on_success_hook
tag @s add overlimit.qt_pay
schedule function overlimit:item/quiet_totem/pay_pulse 1t append
