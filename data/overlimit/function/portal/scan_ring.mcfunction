scoreboard players set #bw_oi overlimit.const 1
execute store result score #bw_olen overlimit.const run data get storage overlimit:portal origins
execute if score #bw_oi overlimit.const < #bw_olen overlimit.const run function overlimit:portal/scan_step
