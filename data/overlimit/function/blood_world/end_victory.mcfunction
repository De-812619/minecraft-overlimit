execute unless score #bw_active overlimit.const matches 1 run return fail
title @a[tag=overlimit.in_bw] times 10 60 20
title @a[tag=overlimit.in_bw] title {"text":"ブラッドムーン","color":"gold"}
title @a[tag=overlimit.in_bw] subtitle {"text":"100体撃破","color":"yellow"}
tellraw @a[tag=overlimit.in_bw] {"text":"ブラッドムーンを押し返した。報酬のエンチャント本を受け取った。","color":"gold"}
execute as @a at @s if dimension overlimit:blood_world run function overlimit:blood_moon/give_book
function overlimit:blood_world/end
