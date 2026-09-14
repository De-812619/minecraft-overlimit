# @s = ノック対象。中心から約6ブロック離す。壁には突っ込まない。
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.4 ^-6.0 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.35 ^-4.0 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.3 ^-2.4 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute facing entity @n[tag=overlimit.kb_center] feet positioned ^ ^0.25 ^-1.0 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run return run tp @s ~ ~ ~
execute at @s if block ~ ~1 ~ #minecraft:replaceable run tp @s ~ ~0.45 ~
execute at @s unless block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable if block ~ ~2 ~ #minecraft:replaceable run tp @s ~ ~1 ~
