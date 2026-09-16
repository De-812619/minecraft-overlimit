# テスト用。発生中なら勝利。未発生なら報酬だけ足元へ（脅威は上がらない）。
execute if score #bw_active overlimit.const matches 1 run return run function overlimit:blood_world/end_victory
function overlimit:reward/give_xp
execute at @s run function overlimit:blood_moon/place_reward
tellraw @s {"translate": "overlimit.cmd.bw_force_reward","color":"gold"}
