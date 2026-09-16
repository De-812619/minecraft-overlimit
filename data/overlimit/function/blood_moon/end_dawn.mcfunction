execute unless score #bm_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"translate": "overlimit.event.blood_moon","color":"dark_red"}
title @a[predicate=overlimit:in_overworld] subtitle {"translate": "overlimit.subtitle.dawn","color":"gray"}
tellraw @a[predicate=overlimit:in_overworld] {"translate": "overlimit.msg.bm.dawn","color":"gray"}
function overlimit:blood_moon/end
function overlimit:pressure/add_1
scoreboard players operation #pressure_skip_day overlimit.const = #bm_daynow overlimit.const

