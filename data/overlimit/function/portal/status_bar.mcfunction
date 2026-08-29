execute if predicate overlimit:in_blood_world run return run title @s actionbar {"text":"オーバーワールドへ転移中…","color":"light_purple"}
execute if score #bw_gate overlimit.const matches 1 run return run title @s actionbar {"text":"ブラッドワールドの門へ…","color":"light_purple"}
execute if score #bw_rand_n overlimit.const matches 1.. run return run title @s actionbar {"text":"転移先の陸地を探しています…","color":"light_purple"}
execute if entity @s[tag=overlimit.portal_arrive] run return run title @s actionbar {"text":"転移中…","color":"light_purple"}
title @s actionbar {"text":"転移準備中（測量しています）…","color":"light_purple"}
