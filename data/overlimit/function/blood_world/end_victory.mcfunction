execute unless score #bw_active overlimit.const matches 1 run return fail
title @a[tag=overlimit.in_bw] times 10 60 20
title @a[tag=overlimit.in_bw] title {"translate": "overlimit.event.blood_moon","color":"gold"}
title @a[tag=overlimit.in_bw] subtitle {"translate": "overlimit.subtitle.kills_100","color":"yellow"}
tellraw @a[tag=overlimit.in_bw] {"translate": "overlimit.msg.bm.victory","color":"gold"}
execute as @a[tag=overlimit.in_bw] run function overlimit:reward/give_xp
execute if score #bw_omen overlimit.const matches 1 as @a[tag=overlimit.in_bw] run function overlimit:reward/give_xp
execute as @a[tag=overlimit.in_bw] at @s run function overlimit:blood_moon/place_reward
function overlimit:blood_world/end
