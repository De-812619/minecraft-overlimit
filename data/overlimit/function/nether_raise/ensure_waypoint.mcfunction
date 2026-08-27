execute store result score #nr_wpr overlimit.const run attribute @s minecraft:waypoint_transmit_range get
execute if score #nr_wpr overlimit.const matches 1.. run return fail
attribute @s minecraft:waypoint_transmit_range base set 2000
waypoint modify @s color gold
