scoreboard players set #cc_ok overlimit.const 0
execute as @a[tag=overlimit.cc_pick,limit=1] at @s run function overlimit:city_clamp/refine_run
execute if score #cc_ok overlimit.const matches 1 run return 1
return fail
