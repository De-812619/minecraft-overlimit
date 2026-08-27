execute store result score #cc_diff overlimit.const run difficulty
execute if score #cc_diff overlimit.const matches 0 run return fail
execute if score #cc_active overlimit.const matches 1 run return fail
execute if entity @e[type=minecraft:ender_dragon] run return fail
execute unless entity @a[predicate=overlimit:in_the_end,gamemode=!spectator] run return fail
scoreboard players set #cc_best overlimit.const 999999
tag @a remove overlimit.cc_pick
execute as @a[predicate=overlimit:in_the_end,gamemode=!spectator] at @s run function overlimit:city_clamp/locate_candidate
execute if score #cc_best overlimit.const > #cc_search overlimit.const run return fail
execute unless entity @a[tag=overlimit.cc_pick,limit=1] run return fail
execute unless function overlimit:city_clamp/refine_target run return fail
function overlimit:city_clamp/start
return 1
