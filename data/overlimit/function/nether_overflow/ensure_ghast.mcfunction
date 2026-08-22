tag @e[tag=overlimit.no_ghast,limit=1,sort=nearest] add overlimit.no_gkeep
execute as @e[tag=overlimit.no_ghast,tag=!overlimit.no_gkeep] run function overlimit:blood_moon/despawn_one
tag @e[tag=overlimit.no_ghast] remove overlimit.no_gkeep
execute if entity @e[tag=overlimit.no_ghast,limit=1] run scoreboard players set #no_ghast_cd overlimit.const -1
execute if entity @e[tag=overlimit.no_ghast,limit=1] run return fail
execute if score #no_ghast_n overlimit.const >= #no_ghast_budget overlimit.const run return fail
execute if score #no_spawned overlimit.const >= #no_budget overlimit.const unless entity @e[tag=overlimit.no_wave,tag=!overlimit.no_ghast] run return fail
execute if score #no_ghast_cd overlimit.const matches -1 store result score #no_ghast_cd overlimit.const run random value 20..1200
execute if score #no_ghast_cd overlimit.const matches 1.. run scoreboard players remove #no_ghast_cd overlimit.const 1
execute if score #no_ghast_cd overlimit.const matches 1.. run return fail
function overlimit:nether_overflow/try_ghast
execute unless entity @e[tag=overlimit.no_ghast,limit=1] run function overlimit:nether_overflow/try_ghast
execute unless entity @e[tag=overlimit.no_ghast,limit=1] run function overlimit:nether_overflow/try_ghast
execute unless entity @e[tag=overlimit.no_ghast,limit=1] run function overlimit:nether_overflow/try_ghast
