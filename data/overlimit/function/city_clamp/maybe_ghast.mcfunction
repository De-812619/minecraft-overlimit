execute store result score #cc_ghast_alive overlimit.const if entity @e[tag=overlimit.cc_ghast]
execute if score #cc_ghast_alive overlimit.const >= #cc_ghast_max overlimit.const run return fail
execute if score #cc_ghast_n overlimit.const >= #cc_ghast_budget overlimit.const run return fail
execute store result score #cc_alive overlimit.const if entity @e[tag=overlimit.cc_wave]
execute if score #cc_alive overlimit.const >= #cc_cap overlimit.const run return fail
execute unless loaded ~ ~ ~ run return fail
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
execute unless block ~ ~2 ~ #minecraft:replaceable run return fail
execute unless block ~ ~3 ~ #minecraft:replaceable run return fail
summon minecraft:ghast ~ ~ ~ {Tags:["overlimit.cc_wave","overlimit.cc_ghast","overlimit.cc_new"],PersistenceRequired:1b,ExplosionPower:1}
execute as @e[type=minecraft:ghast,tag=overlimit.cc_new,limit=1,distance=..8] run function overlimit:city_clamp/mark_ghast
scoreboard players add #cc_ghast_n overlimit.const 1
scoreboard players set #cc_ghast_cd overlimit.const -1
return 1
