execute unless score #bm_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"translate": "overlimit.event.blood_moon","color":"gold"}
title @a[predicate=overlimit:in_overworld] subtitle {"translate": "overlimit.subtitle.kills_100","color":"yellow"}
tellraw @a[predicate=overlimit:in_overworld] {"translate": "overlimit.msg.bm.victory","color":"gold"}
execute as @a[predicate=overlimit:in_overworld] run function overlimit:reward/give_xp
execute if score #bm_omen overlimit.const matches 1 as @a[predicate=overlimit:in_overworld] run function overlimit:reward/give_xp
execute as @a[predicate=overlimit:in_overworld] at @s run function overlimit:blood_moon/place_reward
function overlimit:blood_moon/end
function overlimit:heat/add
function overlimit:pressure/sub_2
