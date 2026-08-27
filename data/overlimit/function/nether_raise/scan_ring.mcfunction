data modify storage overlimit:nr scan_kind set value "minecraft:fortress"
scoreboard players set #nr_skid overlimit.const 1
scoreboard players set #nr_oi overlimit.const 1
execute if score #nr_oi overlimit.const < #nr_olen overlimit.const run function overlimit:nether_raise/scan_step
data modify storage overlimit:nr scan_kind set value "minecraft:bastion_remnant"
scoreboard players set #nr_skid overlimit.const 2
scoreboard players set #nr_oi overlimit.const 1
execute if score #nr_oi overlimit.const < #nr_olen overlimit.const run function overlimit:nether_raise/scan_step
