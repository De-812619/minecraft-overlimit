# @s = player（ブーツの minecraft:tick から呼ばれるので装備確認の data get はしない）
execute if predicate overlimit:on_ground run return run function overlimit:enchant/sky_walk/disarm
execute if predicate overlimit:in_water run return run function overlimit:enchant/sky_walk/disarm
execute if predicate overlimit:wearing_elytra run return run function overlimit:enchant/sky_walk/disarm

execute unless score @s overlimit.sky_air matches 1 run return run function overlimit:enchant/sky_walk/arm_air

# datapack tick が止まっても CD が固まらないよう、空中の装備 tick で減らす
execute if score @s overlimit.cd.sky matches 1.. run scoreboard players remove @s overlimit.cd.sky 1

scoreboard players set #jmp overlimit.const 0
execute if predicate overlimit:enchant/jump_input run scoreboard players set #jmp overlimit.const 1
execute if predicate overlimit:is_sneaking run scoreboard players set #jmp overlimit.const 1

execute unless score #jmp overlimit.const matches 1 run scoreboard players set @s overlimit.sky_jmp 0
execute unless score #jmp overlimit.const matches 1 run return fail
execute if score @s overlimit.sky_jmp matches 1 run return fail

scoreboard players set @s overlimit.sky_jmp 1
execute if score @s overlimit.cd.sky matches 1.. run return fail

scoreboard players set @s overlimit.cd.sky 10
function overlimit:enchant/sky_walk/boost_jump
# Delay footing 2t so launch does not collide with the platform
scoreboard players set @s overlimit.sky_foot_delay 2
