execute store result score #no_diff overlimit.const run difficulty
execute if score #no_diff overlimit.const matches 0 run return fail
execute if score #no_nethering overlimit.const matches 1 run return fail
execute unless entity @a[predicate=overlimit:in_overworld,gamemode=!spectator] run return fail
execute as @a[predicate=overlimit:in_overworld,gamemode=!spectator] at @s run function overlimit:nether_overflow/scan_near
execute as @e[type=minecraft:marker,tag=overlimit.no_gate] at @s run function overlimit:nether_overflow/remember_gate
execute unless data storage overlimit:no gates[0] run return fail
function overlimit:nether_overflow/start
