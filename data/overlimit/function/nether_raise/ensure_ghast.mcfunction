tag @e[tag=overlimit.nr_ghast,limit=1,sort=nearest] add overlimit.nr_gkeep
execute as @e[tag=overlimit.nr_ghast,tag=!overlimit.nr_gkeep] run function overlimit:blood_moon/despawn_one
tag @e[tag=overlimit.nr_ghast] remove overlimit.nr_gkeep
execute if entity @e[tag=overlimit.nr_ghast,limit=1] run scoreboard players set #nr_ghast_cd overlimit.const -1
execute if entity @e[tag=overlimit.nr_ghast,limit=1] run return fail
execute if score #nr_ghast_n overlimit.const >= #nr_ghast_budget overlimit.const run return fail
execute if score #nr_spawned overlimit.const >= #nr_budget overlimit.const unless entity @e[tag=overlimit.nr_wave,tag=!overlimit.nr_ghast] run return fail
execute if score #nr_ghast_cd overlimit.const matches -1 store result score #nr_ghast_cd overlimit.const run random value 20..1200
execute if score #nr_ghast_cd overlimit.const matches 1.. run scoreboard players remove #nr_ghast_cd overlimit.const 1
execute if score #nr_ghast_cd overlimit.const matches 1.. run return fail
function overlimit:nether_raise/try_ghast
execute unless entity @e[tag=overlimit.nr_ghast,limit=1] run function overlimit:nether_raise/try_ghast
