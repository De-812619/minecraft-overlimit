execute if score #nr_paused overlimit.const matches 1 run return fail
execute if score #nr_spawned overlimit.const < #nr_budget overlimit.const run return fail
execute if entity @e[tag=overlimit.nr_wave,tag=!overlimit.nr_ghast] run return fail
execute if score #nr_phase overlimit.const matches 3 run return run function overlimit:nether_raise/end_victory
function overlimit:nether_raise/phase_next
