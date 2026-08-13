# Keep fall damage at 0 while protected. Only end after solid ground for a few ticks.
data modify entity @s FallDistance set value 0.0f

# Still on / near temporary footing → keep protection, reset land counter
execute if entity @e[type=minecraft:marker,tag=overlimit.sky_plat,distance=..4] run scoreboard players set @s overlimit.sky_land 0
execute if entity @e[type=minecraft:marker,tag=overlimit.sky_plat,distance=..4] run return fail
execute if block ~ ~-0.3 ~ minecraft:white_carpet run scoreboard players set @s overlimit.sky_land 0
execute if block ~ ~-0.3 ~ minecraft:white_carpet run return fail

# Airborne → reset land counter
execute unless data entity @s {OnGround:1b} run scoreboard players set @s overlimit.sky_land 0
execute unless data entity @s {OnGround:1b} run return fail

# Real ground: require a few consecutive on-ground ticks (debounce carpet flicker)
scoreboard players add @s overlimit.sky_land 1
execute if score @s overlimit.sky_land matches 5.. run function overlimit:enchant/sky_walk/disable_safe
