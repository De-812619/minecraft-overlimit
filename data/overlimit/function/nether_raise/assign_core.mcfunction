effect clear @a[tag=overlimit.nr_core] minecraft:glowing
tag @a remove overlimit.nr_core
execute at @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] run tag @p[predicate=overlimit:in_nether,gamemode=!spectator,distance=..32] add overlimit.nr_core
execute unless entity @a[tag=overlimit.nr_core] at @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] run tag @p[predicate=overlimit:in_nether,gamemode=!spectator] add overlimit.nr_core
execute unless entity @a[tag=overlimit.nr_core] run return fail
scoreboard players set @a[tag=overlimit.nr_core] overlimit.nr_deaths 0
effect give @a[tag=overlimit.nr_core] minecraft:glowing 1000000 0 true
return 1
