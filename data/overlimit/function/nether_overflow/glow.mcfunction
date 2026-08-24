execute if entity @s[tag=overlimit.warning] run team join overlimit_warn @s
execute if entity @s[tag=overlimit.danger] run team join overlimit_dang @s
execute if entity @s[tag=overlimit.crisis] run team join overlimit_cris @s
execute if entity @s[tag=overlimit.disaster] run team join overlimit_disa @s
effect give @s minecraft:glowing 1000000 0 true
