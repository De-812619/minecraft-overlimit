execute at @s unless entity @p[predicate=overlimit:in_nether,gamemode=!spectator,gamemode=!creative,distance=..40] run return fail
data merge entity @s {IsImmuneToZombification:1b,TimeInOverworld:0}
data modify entity @s Brain.memories."minecraft:angry_at" set value {ttl:6000L,value:[I;0,0,0,0]}
execute at @s run data modify entity @s Brain.memories."minecraft:angry_at".value set from entity @p[predicate=overlimit:in_nether,gamemode=!spectator,gamemode=!creative,distance=..40] UUID
execute at @s run data modify entity @s AngryAt set from entity @p[predicate=overlimit:in_nether,gamemode=!spectator,gamemode=!creative,distance=..40] UUID
execute if entity @s[type=minecraft:piglin] run data modify entity @s AngerTime set value 6000
