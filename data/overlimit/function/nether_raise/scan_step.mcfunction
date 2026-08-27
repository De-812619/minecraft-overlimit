function overlimit:nether_raise/scan_pick_idx
scoreboard players add #nr_oi overlimit.const 1
execute if score #nr_oi overlimit.const < #nr_olen overlimit.const run function overlimit:nether_raise/scan_step
