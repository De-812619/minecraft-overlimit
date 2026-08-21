# 跳躍+0.2は本物の地面だけ。空中・足場では外す（Jump Boost は使わない＝4ブロックになる）。
execute if score @s overlimit.sky_air matches 1 run return run function overlimit:enchant/cat_foot/clear_jump
execute if score @s overlimit.sky_lev matches 1.. run return run function overlimit:enchant/cat_foot/clear_jump
execute if entity @e[type=minecraft:marker,tag=overlimit.sky_plat,distance=..3] run return run function overlimit:enchant/cat_foot/clear_jump
execute if block ~ ~-0.2 ~ minecraft:white_carpet run return run function overlimit:enchant/cat_foot/clear_jump
execute if block ~ ~-1 ~ minecraft:white_carpet run return run function overlimit:enchant/cat_foot/clear_jump
execute unless data entity @s {OnGround:1b} run return run function overlimit:enchant/cat_foot/clear_jump
function overlimit:enchant/cat_foot/ground_jump
