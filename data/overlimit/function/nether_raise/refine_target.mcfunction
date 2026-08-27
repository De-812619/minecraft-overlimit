scoreboard players set #nr_ok overlimit.const 0
execute as @a[tag=overlimit.nr_pick,limit=1] at @s run function overlimit:nether_raise/refine_run
execute if score #nr_ok overlimit.const matches 1 run return 1
return fail
