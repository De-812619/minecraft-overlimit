tag @e[tag=overlimit.cc_ghast,limit=1,sort=nearest] add overlimit.cc_gkeep
execute as @e[tag=overlimit.cc_ghast,tag=!overlimit.cc_gkeep] run function overlimit:blood_moon/despawn_one
tag @e[tag=overlimit.cc_ghast] remove overlimit.cc_gkeep
execute if entity @e[tag=overlimit.cc_ghast,limit=1] run scoreboard players set #cc_ghast_cd overlimit.const -1
execute if entity @e[tag=overlimit.cc_ghast,limit=1] run return fail
execute if score #cc_ghast_n overlimit.const >= #cc_ghast_budget overlimit.const run return fail
execute if score #cc_spawned overlimit.const >= #cc_budget overlimit.const unless entity @e[tag=overlimit.cc_wave,tag=!overlimit.cc_ghast] run return fail
execute if score #cc_ghast_cd overlimit.const matches -1 store result score #cc_ghast_cd overlimit.const run random value 20..1200
execute if score #cc_ghast_cd overlimit.const matches 1.. run scoreboard players remove #cc_ghast_cd overlimit.const 1
execute if score #cc_ghast_cd overlimit.const matches 1.. run return fail
function overlimit:city_clamp/try_ghast
execute unless entity @e[tag=overlimit.cc_ghast,limit=1] run function overlimit:city_clamp/try_ghast
