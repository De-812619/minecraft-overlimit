execute store result score #nr_diff overlimit.const run difficulty
execute if score #nr_diff overlimit.const matches 0 run return fail
execute if score #nr_active overlimit.const matches 1 run return fail
execute unless entity @a[predicate=overlimit:in_nether,gamemode=!spectator] run return fail
scoreboard players set #nr_best overlimit.const 999999
tag @a remove overlimit.nr_pick
execute as @a[predicate=overlimit:in_nether,gamemode=!spectator] at @s run function overlimit:nether_raise/locate_candidate
execute if score #nr_best overlimit.const > #nr_search overlimit.const run return fail
execute unless entity @a[tag=overlimit.nr_pick,limit=1] run return fail
execute unless function overlimit:nether_raise/refine_target run return fail
function overlimit:nether_raise/start
return 1
