# 金防具センサーだけ外す。walk_target は消さない（消すと停止する）。
data remove entity @s Brain.memories."minecraft:nearest_targetable_player_not_wearing_gold"
data remove entity @s Brain.memories."minecraft:nearest_visible_attackable_player"
tag @s add overlimit.trim.gclr
execute on target if entity @s[tag=overlimit.trim.set.gold] as @e[type=minecraft:piglin,tag=overlimit.trim.gclr,limit=1] run function overlimit:trim/gold/drop_hunt
tag @s remove overlimit.trim.gclr
