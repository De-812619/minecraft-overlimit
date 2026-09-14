data modify storage overlimit:ul tmp set from storage overlimit:ul owner
execute store success score #ul_diff overlimit.const run data modify storage overlimit:ul tmp set from entity @s UUID
execute if score #ul_diff overlimit.const matches 0 run tag @s add overlimit.ul.attacker
