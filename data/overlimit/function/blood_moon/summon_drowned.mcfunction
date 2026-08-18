summon minecraft:drowned ~ ~ ~ {Tags:["overlimit.bm_wave"]}
execute as @e[tag=overlimit.bm_wave,tag=!overlimit.elite,distance=..8] run function overlimit:mob/scan_blood_moon
scoreboard players set #bm_spawned overlimit.const 1
