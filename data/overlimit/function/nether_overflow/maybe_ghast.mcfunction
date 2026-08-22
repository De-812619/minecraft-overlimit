execute store result score #no_ghast_alive overlimit.const if entity @e[tag=overlimit.no_ghast]
execute if score #no_ghast_alive overlimit.const >= #no_ghast_max overlimit.const run return fail
execute if score #no_ghast_n overlimit.const >= #no_ghast_budget overlimit.const run return fail
execute store result score #no_alive overlimit.const if entity @e[tag=overlimit.no_wave]
execute if score #no_alive overlimit.const >= #no_cap overlimit.const run return fail
execute unless loaded ~ ~ ~ run return fail
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
execute unless block ~ ~2 ~ #minecraft:replaceable run return fail
execute unless block ~ ~3 ~ #minecraft:replaceable run return fail
summon minecraft:ghast ~ ~ ~ {Tags:["overlimit.no_wave","overlimit.no_ghast","overlimit.no_new"],PersistenceRequired:1b,ExplosionPower:1}
execute as @e[type=minecraft:ghast,tag=overlimit.no_new,limit=1,distance=..8] run function overlimit:nether_overflow/mark_ghast
scoreboard players add #no_ghast_n overlimit.const 1
scoreboard players set #no_ghast_cd overlimit.const -1
return 1
