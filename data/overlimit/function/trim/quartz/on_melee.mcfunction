execute if predicate overlimit:trim/on_ground run return fail
execute store result score #fall overlimit.const run data get entity @s FallDistance 100
execute if score #fall overlimit.const matches ..0 run return fail
execute store result storage overlimit:trim qz.amount double 0.15 run attribute @s minecraft:attack_damage get
execute as @n[type=#overlimit:hostile,tag=!overlimit.summon,distance=..5] run function overlimit:trim/quartz/extra with storage overlimit:trim qz
