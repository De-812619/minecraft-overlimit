execute as @e[tag=overlimit.blood_moon,tag=overlimit.bm_ow] run tag @s add overlimit.bm_scored
execute as @e[tag=overlimit.blood_moon,tag=overlimit.bm_ow] at @s run function overlimit:blood_moon/despawn_one

scoreboard players set #bm_active overlimit.const 0
scoreboard players set #bm_kills overlimit.const 0
scoreboard players set #bm_omen overlimit.const 0
scoreboard players set #bm_spawn_t overlimit.const 0
kill @e[type=minecraft:marker,tag=overlimit.bm_scout,tag=overlimit.bm_ow]
kill @e[type=minecraft:marker,tag=overlimit.bm_yh,tag=overlimit.bm_ow]
kill @e[type=minecraft:marker,tag=overlimit.bm_xp,tag=overlimit.bm_ow]

function overlimit:blood_moon/fog_off
function overlimit:blood_moon/spawn_monsters_on

bossbar set overlimit:blood_moon value 0
bossbar set overlimit:blood_moon players
