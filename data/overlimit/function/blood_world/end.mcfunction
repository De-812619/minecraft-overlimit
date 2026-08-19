function overlimit:blood_world/read_time
execute as @e[tag=overlimit.blood_moon] run tag @s add overlimit.bm_scored
execute as @e[tag=overlimit.blood_moon] at @s run function overlimit:blood_moon/despawn_one

scoreboard players operation #bw_ended_day overlimit.const = #bw_daynow overlimit.const
scoreboard players set #bw_active overlimit.const 0
scoreboard players set #bw_kills overlimit.const 0
scoreboard players set #bw_spawn_t overlimit.const 0
kill @e[type=minecraft:marker,tag=overlimit.bm_scout]
kill @e[type=minecraft:marker,tag=overlimit.bm_yh]
kill @e[type=minecraft:marker,tag=overlimit.bm_xp]

function overlimit:blood_world/fog_off

bossbar set overlimit:blood_world value 0
bossbar set overlimit:blood_world players
