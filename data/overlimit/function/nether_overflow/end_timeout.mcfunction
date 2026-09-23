execute unless score #no_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 70 20
title @a[predicate=overlimit:in_overworld] title {"translate": "overlimit.event.nether_overflow","color":"dark_red","bold":true}
title @a[predicate=overlimit:in_overworld] subtitle {"translate": "overlimit.subtitle.timeout","color":"red"}
tellraw @a[predicate=overlimit:in_overworld] {"translate": "overlimit.msg.no.timeout","color":"red"}
scoreboard players set #no_nethering overlimit.const 1
function overlimit:nether_overflow/end
function overlimit:nether_overflow/netherize
function overlimit:heat/sub

