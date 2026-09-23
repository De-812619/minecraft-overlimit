# @s = ミニゴーレム（at @s）
execute store result score @s overlimit.golem_hp run data get entity @s Health 10
execute unless entity @a[distance=..32,gamemode=!spectator] run return run function overlimit:item/mini_golem/despawn

scoreboard players add @s overlimit.golem_idle 1
execute if data entity @s AngryAt unless data entity @s {AngryAt:[I;0,0,0,0]} run scoreboard players set @s overlimit.golem_idle 0
execute if score @s overlimit.golem_idle matches 1.. if entity @e[type=#overlimit:can_be_danger,distance=..16,limit=1] run scoreboard players set @s overlimit.golem_idle 0
execute if score @s overlimit.golem_idle matches 400.. run return run function overlimit:item/mini_golem/despawn
