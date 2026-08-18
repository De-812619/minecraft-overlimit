summon minecraft:drowned ~ ~ ~ {Tags:["overlimit.bm_wave"]}
execute as @n[tag=overlimit.bm_wave,tag=!overlimit.scanned,distance=..2] run function overlimit:mob/scan_blood_moon
scoreboard players set #bm_spawned overlimit.const 1
