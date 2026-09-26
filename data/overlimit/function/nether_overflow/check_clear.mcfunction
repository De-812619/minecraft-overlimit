execute if score #no_paused overlimit.const matches 1 run return fail
execute if score #no_spawned overlimit.const < #no_budget overlimit.const run return fail
overlimit event_mobs no_alive
execute if score #no_alive overlimit.const > #no_ghast_alive overlimit.const run return fail
execute if score #no_phase overlimit.const matches 3 run return run function overlimit:nether_overflow/end_victory
function overlimit:nether_overflow/phase_next
