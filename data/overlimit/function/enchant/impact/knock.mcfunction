# Impact専用ノック（共通 util の約3倍: 2.0/1.2/0.6 → 6.0/3.6/1.8）
# @s = knock target. Requires overlimit.kb_center nearby.

execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.35 ^-6.0 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.35 ^-3.6 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.3 ^-1.8 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~

execute at @s if block ~ ~1 ~ #minecraft:replaceable run tp @s ~ ~1.0 ~

execute at @s unless block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable if block ~ ~2 ~ #minecraft:replaceable run tp @s ~ ~1 ~
execute at @s unless block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable if block ~ ~2 ~ #minecraft:replaceable run tp @s ~ ~1 ~
