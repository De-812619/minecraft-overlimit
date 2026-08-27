execute if score #nr_active overlimit.const matches 1 run function overlimit:nether_raise/tick_active
execute unless score #nr_active overlimit.const matches 1 if entity @a[predicate=overlimit:in_nether,gamemode=!spectator] run scoreboard players add #nr_dwell overlimit.const 1
execute unless score #nr_active overlimit.const matches 1 if score #nr_dwell overlimit.const >= #nr_dwell_max overlimit.const run function overlimit:nether_raise/try_start_gated
