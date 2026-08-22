execute unless entity @a[tag=overlimit.no_core,limit=1] run return fail
data merge entity @s {IsImmuneToZombification:1b,TimeInOverworld:0}
data modify entity @s Brain.memories."minecraft:angry_at" set value {ttl:6000L,value:[I;0,0,0,0]}
data modify entity @s Brain.memories."minecraft:angry_at".value set from entity @a[tag=overlimit.no_core,limit=1] UUID
data modify entity @s AngryAt set from entity @a[tag=overlimit.no_core,limit=1] UUID
data modify entity @s AngerTime set value 6000
