# Creeper-ish knock away from blast center. Wall-safe (no tp into solid).
# @s = knock target at its own position. Requires overlimit.kb_center nearby.

execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.35 ^-3.0 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.3 ^-1.8 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.25 ^-0.9 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~

execute at @s if block ~ ~1 ~ #minecraft:replaceable run tp @s ~ ~0.45 ~

execute at @s unless block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable if block ~ ~2 ~ #minecraft:replaceable run tp @s ~ ~1 ~
execute at @s unless block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable if block ~ ~2 ~ #minecraft:replaceable run tp @s ~ ~1 ~
