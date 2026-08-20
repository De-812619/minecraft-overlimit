scoreboard players set #bw_reroll_tick overlimit.const 0
execute as @a[tag=overlimit.portal_arrive] at @s run function overlimit:portal/arrive_one
execute if entity @a[tag=overlimit.portal_arrive] run schedule function overlimit:portal/arrive 2t replace
