# @s = owning player. Hit location tagged overlimit.hit_loc.
tag @s add overlimit.summoning

scoreboard players set #wolves overlimit.const 0
execute as @e[type=minecraft:wolf,tag=overlimit.summon_wolf] on owner if entity @s[tag=overlimit.summoning] run scoreboard players add #wolves overlimit.const 1
execute if score #wolves overlimit.const matches 3.. run tag @s remove overlimit.summoning
execute if score #wolves overlimit.const matches 3.. run return fail

scoreboard players set #summons overlimit.const 0
execute as @e[tag=overlimit.summon] on owner if entity @s[tag=overlimit.summoning] run scoreboard players add #summons overlimit.const 1
execute if score #summons overlimit.const matches 10.. run tag @s remove overlimit.summoning
execute if score #summons overlimit.const matches 10.. run return fail

execute at @n[tag=overlimit.hit_loc] run function overlimit:enchant/summon_wolf/summon_one
tag @s remove overlimit.summoning
