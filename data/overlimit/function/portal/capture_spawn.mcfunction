# #minecraft:load の実行位置はワールドスポーン。Marker で X/Z を取る。
kill @e[type=minecraft:marker,tag=overlimit.spawn_cap]
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.spawn_cap"]}
execute as @e[type=minecraft:marker,tag=overlimit.spawn_cap,limit=1] store result score #bw_spawn_x overlimit.const run data get entity @s Pos[0]
execute as @e[type=minecraft:marker,tag=overlimit.spawn_cap,limit=1] store result score #bw_spawn_z overlimit.const run data get entity @s Pos[2]
kill @e[type=minecraft:marker,tag=overlimit.spawn_cap]
execute unless score #bw_spawn_x overlimit.const matches -2147483648.. run scoreboard players set #bw_spawn_x overlimit.const 0
execute unless score #bw_spawn_z overlimit.const matches -2147483648.. run scoreboard players set #bw_spawn_z overlimit.const 0
