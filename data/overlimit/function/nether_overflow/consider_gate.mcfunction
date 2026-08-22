execute store result score #no_gx2 overlimit.const run data get entity @s Pos[0]
execute store result score #no_gz2 overlimit.const run data get entity @s Pos[2]
scoreboard players set #no_mind overlimit.const 2147483647
execute as @a[predicate=overlimit:in_overworld,gamemode=!spectator] run function overlimit:nether_overflow/dist_player
execute if score #no_mind overlimit.const < #no_best overlimit.const run function overlimit:nether_overflow/mark_best
