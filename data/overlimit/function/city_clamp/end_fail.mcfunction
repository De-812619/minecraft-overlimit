execute unless score #cc_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_the_end] times 10 70 20
title @a[predicate=overlimit:in_the_end] title {"text":"シティクランプ","color":"dark_red","bold":true}
title @a[predicate=overlimit:in_the_end] subtitle {"text":"鎮圧失敗","color":"red"}
tellraw @a[predicate=overlimit:in_the_end] {"text":"コアが落ちた。シティは未鎮圧のままだ。","color":"red"}
function overlimit:city_clamp/end
function overlimit:pressure/add_1
