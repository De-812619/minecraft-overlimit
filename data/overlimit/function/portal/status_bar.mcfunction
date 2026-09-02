execute if predicate overlimit:in_blood_world run return run title @s actionbar {"text":"オーバーワールドへ転移中…","color":"light_purple"}
execute if entity @s[tag=overlimit.portal_arrive] run return run title @s actionbar {"text":"転移中…","color":"light_purple"}
title @s actionbar {"text":"ブラッドワールドへ転移中…","color":"light_purple"}
