# テスト用。発生中なら勝利。未発生なら報酬だけ足元へ（脅威は上がらない）。
execute if score #nr_active overlimit.const matches 1 run return run function overlimit:nether_raise/end_victory
function overlimit:reward/give_xp
execute at @s run function overlimit:nether_raise/place_reward
tellraw @s {"translate": "overlimit.cmd.nr_force_reward","color":"gold"}
