$scoreboard players set #no_gx2 overlimit.const $(x)
$scoreboard players set #no_gz2 overlimit.const $(z)
scoreboard players set #no_mind overlimit.const 2147483647
execute as @a[predicate=overlimit:in_overworld,gamemode=!spectator] run function overlimit:nether_overflow/dist_player
execute if score #no_mind overlimit.const < #no_best overlimit.const run function overlimit:nether_overflow/mark_stored
