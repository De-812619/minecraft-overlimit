effect clear @a[tag=overlimit.no_core] minecraft:glowing
tag @a remove overlimit.no_core
execute if data storage overlimit:no gate.x run function overlimit:nether_overflow/assign_core_at with storage overlimit:no gate
execute unless entity @a[tag=overlimit.no_core] at @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] run tag @p[predicate=overlimit:in_overworld,gamemode=!spectator] add overlimit.no_core
execute unless entity @a[tag=overlimit.no_core] run return fail
scoreboard players set @a[tag=overlimit.no_core] overlimit.no_deaths 0
effect give @a[tag=overlimit.no_core] minecraft:glowing 1000000 0 true
return 1
