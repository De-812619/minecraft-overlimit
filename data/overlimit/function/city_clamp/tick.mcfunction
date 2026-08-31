execute if score #cc_active overlimit.const matches 1 run function overlimit:city_clamp/tick_active
execute unless score #cc_active overlimit.const matches 1 if entity @a[predicate=overlimit:in_the_end,gamemode=!spectator] run scoreboard players add #cc_dwell overlimit.const 1
execute unless score #cc_active overlimit.const matches 1 if score #cc_dwell overlimit.const >= #cc_dwell_max overlimit.const run function overlimit:city_clamp/try_start
