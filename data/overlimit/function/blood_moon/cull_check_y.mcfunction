# @s = プレイヤー。モブY(#bm_my)との差が ±8 なら残す。
execute store result score #bm_py2 overlimit.const run data get entity @s Pos[1]
scoreboard players operation #bm_py2 overlimit.const -= #bm_my overlimit.const
execute if score #bm_py2 overlimit.const matches -8..8 run scoreboard players set #bm_keep overlimit.const 1
