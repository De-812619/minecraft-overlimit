execute unless score #nr_active overlimit.const matches 1 run return fail
title @a[predicate=overlimit:in_nether] times 10 70 20
title @a[predicate=overlimit:in_nether] title {"text":"ネザーレイズ","color":"dark_red","bold":true}
title @a[predicate=overlimit:in_nether] subtitle {"text":"鎮圧失敗","color":"red"}
tellraw @a[predicate=overlimit:in_nether] {"text":"コアが落ちた。構造物は未鎮圧のままだ。","color":"red"}
execute unless score #nr_fail_boost overlimit.const matches 1 run scoreboard players set #nr_fail_boost overlimit.const 1
function overlimit:nether_raise/end
function overlimit:pressure/add_1
