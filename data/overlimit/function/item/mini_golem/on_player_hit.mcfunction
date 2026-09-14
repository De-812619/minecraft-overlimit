advancement revoke @s only overlimit:item/mini_golem_hit
execute at @s as @e[type=minecraft:iron_golem,tag=overlimit.mini_golem,distance=..24] if data entity @s {HurtTime:10s} run function overlimit:item/mini_golem/undo_hit
