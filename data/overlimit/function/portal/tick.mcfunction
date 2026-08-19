execute as @a[scores={overlimit.portal_cd=1..}] run scoreboard players remove @s overlimit.portal_cd 1
execute as @e[type=minecraft:marker,tag=overlimit.bw_portal] at @s run function overlimit:portal/idle

tag @a remove overlimit.in_gate
execute as @e[type=minecraft:marker,tag=overlimit.bw_portal_x] at @s align xyz as @a[dx=1,dy=2,dz=0,gamemode=!spectator] run tag @s add overlimit.in_gate
execute as @e[type=minecraft:marker,tag=overlimit.bw_portal_z] at @s align xyz as @a[dx=0,dy=2,dz=1,gamemode=!spectator] run tag @s add overlimit.in_gate

execute as @a[tag=overlimit.in_gate] at @s unless score @s overlimit.portal_cd matches 1.. run function overlimit:portal/charge
execute as @a[tag=!overlimit.in_gate,scores={overlimit.portal_charge=1..}] run function overlimit:portal/charge_abort
