execute store result score #cc_try overlimit.const run locate structure minecraft:end_city
execute if score #cc_try overlimit.const matches 1.. if score #cc_try overlimit.const < #cc_best overlimit.const run function overlimit:city_clamp/set_best_city
