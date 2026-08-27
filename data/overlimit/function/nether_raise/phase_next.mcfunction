execute if score #nr_phase overlimit.const matches 3 run return fail
scoreboard players add #nr_phase overlimit.const 1
scoreboard players set #nr_phase_t overlimit.const 0
scoreboard players set #nr_spawned overlimit.const 0
scoreboard players set #nr_ghast_n overlimit.const 0
scoreboard players set #nr_ghast_cd overlimit.const 0
execute if entity @e[tag=overlimit.nr_ghast] run scoreboard players set #nr_ghast_n overlimit.const 1
execute if entity @e[tag=overlimit.nr_ghast] run scoreboard players set #nr_ghast_cd overlimit.const -1
execute if score #nr_phase overlimit.const matches 2 run scoreboard players operation #nr_budget overlimit.const = #nr_budget2 overlimit.const
execute if score #nr_phase overlimit.const matches 3 run scoreboard players operation #nr_budget overlimit.const = #nr_budget3 overlimit.const
execute if score #nr_phase overlimit.const matches 2 run scoreboard players operation #nr_int overlimit.const = #nr_int2 overlimit.const
execute if score #nr_phase overlimit.const matches 3 run scoreboard players operation #nr_int overlimit.const = #nr_int3 overlimit.const
function overlimit:nether_raise/bossbar_value
function overlimit:nether_raise/bossbar_name
title @a[predicate=overlimit:in_nether] actionbar {"text":"ネザーレイズの脅威が増した","color":"red"}
