execute unless score #cc_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_the_end] times 10 70 20
title @a[predicate=overlimit:in_the_end] title {"translate": "overlimit.event.city_clamp","color":"dark_red","bold":true}
title @a[predicate=overlimit:in_the_end] subtitle {"translate": "overlimit.subtitle.timeout","color":"red"}
tellraw @a[predicate=overlimit:in_the_end] {"translate": "overlimit.msg.nr.timeout","color":"red"}
function overlimit:city_clamp/end
function overlimit:pressure/add_1
