# 前回門から 768 マス未満なら、抽選方向へ 1024 マス押し出す。
scoreboard players set #neg overlimit.const -1
scoreboard players operation #adx overlimit.const = #ox overlimit.const
scoreboard players operation #adx overlimit.const -= #bw_origin_x overlimit.const
execute if score #adx overlimit.const matches ..-1 run scoreboard players operation #adx overlimit.const *= #neg overlimit.const
scoreboard players operation #adz overlimit.const = #oz overlimit.const
scoreboard players operation #adz overlimit.const -= #bw_origin_z overlimit.const
execute if score #adz overlimit.const matches ..-1 run scoreboard players operation #adz overlimit.const *= #neg overlimit.const
execute unless score #adx overlimit.const matches ..768 run return fail
execute unless score #adz overlimit.const matches ..768 run return fail
execute if score #dx overlimit.const matches 0.. run scoreboard players add #ox overlimit.const 1024
execute if score #dx overlimit.const matches ..-1 run scoreboard players remove #ox overlimit.const 1024
