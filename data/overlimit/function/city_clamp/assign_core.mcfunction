effect clear @a[tag=overlimit.cc_core] minecraft:glowing
tag @a remove overlimit.cc_core
execute at @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] run tag @p[predicate=overlimit:in_the_end,gamemode=!spectator,distance=..32] add overlimit.cc_core
execute unless entity @a[tag=overlimit.cc_core] at @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] run tag @p[predicate=overlimit:in_the_end,gamemode=!spectator] add overlimit.cc_core
execute unless entity @a[tag=overlimit.cc_core] run return fail
scoreboard players set @a[tag=overlimit.cc_core] overlimit.cc_deaths 0
effect give @a[tag=overlimit.cc_core] minecraft:glowing 1000000 0 true
return 1
