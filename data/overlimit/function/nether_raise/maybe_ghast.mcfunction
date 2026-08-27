execute store result score #nr_ghast_alive overlimit.const if entity @e[tag=overlimit.nr_ghast]
execute if score #nr_ghast_alive overlimit.const >= #nr_ghast_max overlimit.const run return fail
execute if score #nr_ghast_n overlimit.const >= #nr_ghast_budget overlimit.const run return fail
execute store result score #nr_alive overlimit.const if entity @e[tag=overlimit.nr_wave]
execute if score #nr_alive overlimit.const >= #nr_cap overlimit.const run return fail
execute unless loaded ~ ~ ~ run return fail
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
execute unless block ~ ~2 ~ #minecraft:replaceable run return fail
execute unless block ~ ~3 ~ #minecraft:replaceable run return fail
summon minecraft:ghast ~ ~ ~ {Tags:["overlimit.nr_wave","overlimit.nr_ghast","overlimit.nr_new"],PersistenceRequired:1b,ExplosionPower:1}
execute as @e[type=minecraft:ghast,tag=overlimit.nr_new,limit=1,distance=..8] run function overlimit:nether_raise/mark_ghast
scoreboard players add #nr_ghast_n overlimit.const 1
scoreboard players set #nr_ghast_cd overlimit.const -1
return 1
