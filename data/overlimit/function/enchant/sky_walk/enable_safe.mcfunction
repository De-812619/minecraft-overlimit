# Apply zero fall-damage until a confirmed real landing.
attribute @s minecraft:fall_damage_multiplier modifier remove overlimit:sky_nofall
attribute @s minecraft:fall_damage_multiplier modifier add overlimit:sky_nofall -1.0 add_multiplied_total
scoreboard players set @s overlimit.sky_safe 1
scoreboard players set @s overlimit.sky_land 0
data modify entity @s FallDistance set value 0.0f
