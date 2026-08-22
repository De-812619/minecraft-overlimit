execute if score #no_phase overlimit.const matches 3 run return fail
scoreboard players add #no_phase overlimit.const 1
scoreboard players set #no_phase_t overlimit.const 0
scoreboard players set #no_spawned overlimit.const 0
scoreboard players set #no_ghast_n overlimit.const 0
scoreboard players set #no_ghast_cd overlimit.const 0
execute if entity @e[tag=overlimit.no_ghast] run scoreboard players set #no_ghast_n overlimit.const 1
execute if entity @e[tag=overlimit.no_ghast] run scoreboard players set #no_ghast_cd overlimit.const -1
execute if score #no_phase overlimit.const matches 2 run scoreboard players operation #no_budget overlimit.const = #no_budget2 overlimit.const
execute if score #no_phase overlimit.const matches 3 run scoreboard players operation #no_budget overlimit.const = #no_budget3 overlimit.const
execute if score #no_phase overlimit.const matches 2 run scoreboard players operation #no_int overlimit.const = #no_int2 overlimit.const
execute if score #no_phase overlimit.const matches 3 run scoreboard players operation #no_int overlimit.const = #no_int3 overlimit.const
function overlimit:nether_overflow/bossbar_value
function overlimit:nether_overflow/bossbar_name
title @a[predicate=overlimit:in_overworld] actionbar {"text":"ネザーオーバーフローの脅威が増した","color":"red"}
