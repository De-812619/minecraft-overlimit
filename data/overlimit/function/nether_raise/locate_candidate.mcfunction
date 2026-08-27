execute store result score #nr_try overlimit.const run locate structure minecraft:fortress
execute if score #nr_try overlimit.const matches 1.. if score #nr_try overlimit.const < #nr_best overlimit.const run function overlimit:nether_raise/set_best_fortress
execute store result score #nr_try overlimit.const run locate structure minecraft:bastion_remnant
execute if score #nr_try overlimit.const matches 1.. if score #nr_try overlimit.const < #nr_best overlimit.const run function overlimit:nether_raise/set_best_bastion
