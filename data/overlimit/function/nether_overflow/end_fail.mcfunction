execute unless score #no_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_overworld] times 10 70 20
title @a[predicate=overlimit:in_overworld] title {"text":"ネザーオーバーフロー","color":"dark_red","bold":true}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"防衛失敗","color":"red"}
tellraw @a[predicate=overlimit:in_overworld] {"text":"コアが落ちた。ゲート周辺がネザーに侵食される。","color":"red"}
scoreboard players set #no_nethering overlimit.const 1
function overlimit:nether_overflow/end
function overlimit:nether_overflow/netherize

