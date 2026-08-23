$execute in minecraft:overworld positioned $(x) $(y) $(z) as @e[type=minecraft:marker,tag=overlimit.no_gate,distance=..2] run tag @s add overlimit.no_target
$execute in minecraft:overworld positioned $(x) $(y) $(z) unless entity @e[type=minecraft:marker,tag=overlimit.no_target,distance=..2] run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.no_gate","overlimit.no_target"]}
$execute in minecraft:overworld positioned $(x) $(y) $(z) as @e[type=minecraft:marker,tag=overlimit.no_target,distance=..2,limit=1] store result score @s overlimit.no_gfail run data get storage overlimit:no gate.gfail
