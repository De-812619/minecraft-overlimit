execute as @e[tag=overlimit.blood_moon] at @s run function overlimit:blood_moon/despawn_one

scoreboard players set #bm_active overlimit.const 0
scoreboard players set #bm_kills overlimit.const 0

function overlimit:blood_moon/fog_off

bossbar set overlimit:blood_moon value 0
bossbar set overlimit:blood_moon players
