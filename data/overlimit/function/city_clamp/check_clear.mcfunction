execute if score #cc_paused overlimit.const matches 1 run return fail
execute if score #cc_spawned overlimit.const < #cc_budget overlimit.const run return fail
execute if entity @e[tag=overlimit.cc_wave] run return fail
execute if score #cc_phase overlimit.const matches 3 run return run function overlimit:city_clamp/end_victory
function overlimit:city_clamp/phase_next
