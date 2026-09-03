# 2tick。属性は 10tick ごと。金ピグリンは 1tick（tick.mcfunction）。樹脂視線はこちら。
execute store result score #trim_t overlimit.const run time query gametime
scoreboard players operation #trim_t overlimit.const %= #10 overlimit.const
execute if score #trim_t overlimit.const matches 0 as @a run function overlimit:trim/scan
execute as @a[tag=overlimit.trim.set.resin] at @s run function overlimit:trim/resin/tick
execute as @a[tag=overlimit.trim.set.emerald] at @s run function overlimit:trim/emerald/tick
execute as @a[tag=overlimit.trim.set.amethyst] at @s run function overlimit:trim/amethyst/tick
execute as @e[type=#overlimit:trim_look_stop,tag=overlimit.trim.look_stop] run function overlimit:trim/resin/linger
execute as @e[type=#overlimit:trim_illager,tag=overlimit.trim.em_aura] at @s run function overlimit:trim/emerald/expire
execute as @a[scores={overlimit.trim.anger=1..}] run scoreboard players remove @s overlimit.trim.anger 2
execute as @a[scores={overlimit.trim.cu_hits=1..}] run scoreboard players add @s overlimit.trim.cu_age 2
execute as @a[scores={overlimit.trim.cu_age=200..}] run function overlimit:trim/copper/reset_hits
execute as @a[scores={overlimit.trim.amy_cd=1..}] run scoreboard players remove @s overlimit.trim.amy_cd 2
schedule function overlimit:trim/loop 2t replace
