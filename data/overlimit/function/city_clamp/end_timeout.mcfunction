execute unless score #cc_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_the_end] times 10 70 20
title @a[predicate=overlimit:in_the_end] title {"text":"シティクランプ","color":"dark_red","bold":true}
title @a[predicate=overlimit:in_the_end] subtitle {"text":"時間切れ","color":"red"}
tellraw @a[predicate=overlimit:in_the_end] {"text":"制限時間内に敵を殲滅できなかった。","color":"red"}
function overlimit:city_clamp/end
function overlimit:pressure/add_1
