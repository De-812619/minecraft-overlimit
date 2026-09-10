execute unless entity @s[tag=overlimit.elite] run return fail
tag @s add overlimit.blood_moon
execute if dimension overlimit:blood_world run tag @s add overlimit.bm_bw
execute unless entity @s[tag=overlimit.bm_bw] run tag @s add overlimit.bm_ow
execute if entity @s[tag=overlimit.crisis] run tag @s add overlimit.bm_crisis
execute if entity @s[tag=overlimit.disaster] run tag @s add overlimit.bm_disaster
execute unless entity @s[tag=overlimit.crisis] unless entity @s[tag=overlimit.disaster] run tag @s add overlimit.bm_normal
execute if predicate overlimit:in_blood_world run scoreboard players set #follow_add overlimit.const 24
execute if predicate overlimit:in_overworld run scoreboard players operation #follow_add overlimit.const = #bm_follow overlimit.const
execute store result storage overlimit:heat follow int 1 run scoreboard players get #follow_add overlimit.const
function overlimit:blood_moon/mark_elite_follow with storage overlimit:heat
execute on passengers if entity @s[tag=overlimit.elite_xp] run tag @s add overlimit.bm_xp
execute if entity @s[tag=overlimit.bm_bw] on passengers if entity @s[tag=overlimit.elite_xp] run tag @s add overlimit.bm_bw
execute if entity @s[tag=overlimit.bm_ow] on passengers if entity @s[tag=overlimit.elite_xp] run tag @s add overlimit.bm_ow
execute at @s run tag @e[type=minecraft:marker,tag=overlimit.elite_xp,distance=..3] add overlimit.bm_xp
execute if entity @s[tag=overlimit.bm_bw] at @s run tag @e[type=minecraft:marker,tag=overlimit.elite_xp,distance=..3] add overlimit.bm_bw
execute if entity @s[tag=overlimit.bm_ow] at @s run tag @e[type=minecraft:marker,tag=overlimit.elite_xp,distance=..3] add overlimit.bm_ow
