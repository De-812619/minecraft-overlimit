# テスト用。夜にしてイベントを強制開始し、撃破点を 99 にする。
execute if score #bm_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.bm_active","color":"red"}
execute if score #no_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.during_no_bm","color":"red"}
execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run tellraw @s {"translate": "overlimit.cmd.peaceful_mobs","color":"red"}
execute in minecraft:overworld run time set 13000
function overlimit:blood_moon/start
scoreboard players set #bm_kills overlimit.const 99
function overlimit:blood_moon/bossbar_name
tellraw @s {"translate": "overlimit.cmd.bm_force_start_99","color":"gold"}
