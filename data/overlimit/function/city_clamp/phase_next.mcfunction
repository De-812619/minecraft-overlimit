execute if score #cc_phase overlimit.const matches 3 run return fail
scoreboard players add #cc_phase overlimit.const 1
scoreboard players set #cc_phase_t overlimit.const 0
scoreboard players set #cc_spawned overlimit.const 0
execute if score #cc_phase overlimit.const matches 2 run scoreboard players operation #cc_budget overlimit.const = #cc_budget2 overlimit.const
execute if score #cc_phase overlimit.const matches 3 run scoreboard players operation #cc_budget overlimit.const = #cc_budget3 overlimit.const
execute if score #cc_phase overlimit.const matches 2 run scoreboard players operation #cc_int overlimit.const = #cc_int2 overlimit.const
execute if score #cc_phase overlimit.const matches 3 run scoreboard players operation #cc_int overlimit.const = #cc_int3 overlimit.const
execute if score #cc_phase overlimit.const matches 3 run function overlimit:city_clamp/spawn_boss
function overlimit:city_clamp/bossbar_value
function overlimit:city_clamp/bossbar_name
title @a[predicate=overlimit:in_the_end] actionbar {"text":"シティクランプの脅威が増した","color":"red"}
