execute unless score #bw_active overlimit.const matches 1 run return fail
title @a[tag=overlimit.in_bw] times 10 60 20
title @a[tag=overlimit.in_bw] title {"text":"ブラッドムーン","color":"dark_red"}
title @a[tag=overlimit.in_bw] subtitle {"text":"夜が明けた","color":"gray"}
tellraw @a[tag=overlimit.in_bw] {"text":"ブラッドムーンは朝とともに終わった。","color":"gray"}
function overlimit:blood_world/end
