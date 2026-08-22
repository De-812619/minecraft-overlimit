execute store result score #no_alive overlimit.const if entity @e[tag=overlimit.no_wave]
execute if score #no_alive overlimit.const >= #no_cap overlimit.const run return fail
function overlimit:nether_overflow/try_spawn
scoreboard players add #no_burst_i overlimit.const 1
execute if score #no_burst_i overlimit.const < #no_burst overlimit.const run function overlimit:nether_overflow/spawn_burst_loop
