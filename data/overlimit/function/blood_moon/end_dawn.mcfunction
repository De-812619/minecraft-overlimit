execute unless score #bm_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"text":"ブラッドムーン","color":"dark_red"}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"夜が明けた","color":"gray"}
tellraw @a[predicate=overlimit:in_overworld] {"text":"ブラッドムーンは朝とともに終わった。","color":"gray"}
function overlimit:blood_moon/end
function overlimit:pressure/add_1
scoreboard players operation #pressure_skip_day overlimit.const = #bm_daynow overlimit.const

