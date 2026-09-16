execute unless score #bw_active overlimit.const matches 1 run return fail
title @a[tag=overlimit.in_bw] times 10 60 20
title @a[tag=overlimit.in_bw] title {"translate": "overlimit.event.blood_moon","color":"dark_red"}
title @a[tag=overlimit.in_bw] subtitle {"translate": "overlimit.subtitle.dawn","color":"gray"}
tellraw @a[tag=overlimit.in_bw] {"translate": "overlimit.msg.bm.dawn","color":"gray"}
function overlimit:blood_world/end
