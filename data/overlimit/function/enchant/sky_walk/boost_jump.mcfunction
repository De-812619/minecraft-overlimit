# Same launch for all states; extra cancel only while falling.
# No tp. Footing is delayed (see sky_foot_delay) to avoid collision camera snap.
data modify entity @s FallDistance set value 0.0f
execute store result score #sky_vy overlimit.const run data get entity @s Motion[1] 1000

data modify entity @s Motion[1] set value 0.85d
effect clear @s minecraft:levitation

# Baseline pulse (rising / apex / mild fall) — must be enough without prior upward speed
effect give @s minecraft:levitation 1 15 true
scoreboard players set @s overlimit.sky_lev 5

# Extra cancel while falling (keep final feel close to baseline)
execute if score #sky_vy overlimit.const matches -399..-1 run effect give @s minecraft:levitation 1 20 true
execute if score #sky_vy overlimit.const matches -399..-1 run scoreboard players set @s overlimit.sky_lev 6

execute if score #sky_vy overlimit.const matches -799..-400 run effect give @s minecraft:levitation 1 26 true
execute if score #sky_vy overlimit.const matches -799..-400 run scoreboard players set @s overlimit.sky_lev 7

execute if score #sky_vy overlimit.const matches ..-800 run effect give @s minecraft:levitation 1 32 true
execute if score #sky_vy overlimit.const matches ..-800 run scoreboard players set @s overlimit.sky_lev 8

playsound minecraft:entity.breeze.jump player @a ~ ~ ~ 0.5 1.25
particle minecraft:cloud ~ ~0.05 ~ 0.22 0.02 0.22 0.01 8
function overlimit:enchant/sky_walk/enable_safe
