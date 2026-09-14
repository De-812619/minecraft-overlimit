execute if score #heat overlimit.const matches 0 run function overlimit:attrition/apply_iron_0
execute if score #heat overlimit.const matches 1 run function overlimit:attrition/apply_iron_1
execute if score #heat overlimit.const matches 2 run function overlimit:attrition/apply_iron_2
execute if score #heat overlimit.const matches 3 run function overlimit:attrition/apply_iron_3
execute if score #heat overlimit.const matches 4 run function overlimit:attrition/apply_iron_4
execute unless score #heat overlimit.const matches 0..4 run function overlimit:attrition/apply_iron_5
