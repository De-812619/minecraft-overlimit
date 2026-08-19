advancement revoke @s only overlimit:portal/light
execute unless predicate overlimit:in_overworld unless predicate overlimit:in_blood_world run return fail
scoreboard players set #portal_ray overlimit.const 0
scoreboard players set #portal_lit overlimit.const 0
execute at @s anchored eyes positioned ^ ^ ^0.5 run function overlimit:portal/ray
execute if score #portal_lit overlimit.const matches 1 run scoreboard players set @s overlimit.portal_cd 40
execute if score #portal_lit overlimit.const matches 1 run tellraw @s {"text":"ブラッドワールドのポータルが開いた","color":"dark_red"}
execute if score #portal_lit overlimit.const matches 1 at @s run playsound minecraft:block.portal.trigger block @s ~ ~ ~ 0.6 0.7
