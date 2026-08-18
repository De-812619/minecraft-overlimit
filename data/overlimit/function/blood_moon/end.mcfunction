execute as @e[tag=overlimit.blood_moon] run tag @s add overlimit.bm_scored
execute as @e[tag=overlimit.blood_moon] at @s run function overlimit:blood_moon/despawn_one

scoreboard players set #bm_active overlimit.const 0
scoreboard players set #bm_kills overlimit.const 0
scoreboard players set #bm_spawn_t overlimit.const 0
kill @e[type=minecraft:marker,tag=overlimit.bm_scout]
kill @e[type=minecraft:marker,tag=overlimit.bm_yh]
kill @e[type=minecraft:marker,tag=overlimit.bm_xp]

function overlimit:blood_moon/fog_off
function overlimit:blood_moon/spawn_monsters_on

bossbar set overlimit:blood_moon value 0
bossbar set overlimit:blood_moon players
