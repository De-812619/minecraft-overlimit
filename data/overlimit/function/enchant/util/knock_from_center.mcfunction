# @s = knock target. Requires a tagged center entity nearby.
# $center_tag is not used — callers set overlimit.kb_center before calling.
# Prefer open space away from center; never tp into solid blocks.

execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.25 ^-2.0 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.25 ^-1.2 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.25 ^-0.6 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~

# Wall nearby: vertical nudge only (no horizontal into blocks)
execute at @s if block ~ ~1 ~ #minecraft:replaceable run tp @s ~ ~0.35 ~

# If somehow still inside a solid, climb out
execute at @s unless block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable if block ~ ~2 ~ #minecraft:replaceable run tp @s ~ ~1 ~
execute at @s unless block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable if block ~ ~2 ~ #minecraft:replaceable run tp @s ~ ~1 ~
