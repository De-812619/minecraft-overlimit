function overlimit:portal/scan_pick_idx
scoreboard players add #bw_oi overlimit.const 1
execute if score #bw_oi overlimit.const < #bw_olen overlimit.const run function overlimit:portal/scan_step
