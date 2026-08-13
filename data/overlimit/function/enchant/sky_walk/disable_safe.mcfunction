attribute @s minecraft:fall_damage_multiplier modifier remove overlimit:sky_nofall
scoreboard players set @s overlimit.sky_safe 0
scoreboard players set @s overlimit.sky_land 0
data modify entity @s FallDistance set value 0.0f
