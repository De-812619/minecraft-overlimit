tellraw @a [{"selector":"@s","color":"aqua"},{"text":" が静寂のトーテムでブラッドムーンを抑止した。","color":"gray"}]
title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"text":"ブラッドムーン","color":"dark_red"}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"抑止された","color":"aqua"}
function overlimit:blood_moon/end
function overlimit:suppress/on_success_hook
tag @s add overlimit.qt_pay
schedule function overlimit:item/quiet_totem/pay_pulse 1t append
