execute on passengers if entity @s[tag=overlimit.elite_xp] run kill @s
data merge entity @s {DeathLootTable:"minecraft:empty",Silent:1b}
tp @s 0.0 -10000.0 0.0
kill @s
