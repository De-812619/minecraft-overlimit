# テスト用。発生中なら勝利。未発生なら報酬だけ足元へ（脅威は上がらない）。
execute if score #cc_active overlimit.const matches 1 run return run function overlimit:city_clamp/end_victory
function overlimit:reward/give_xp
execute at @s run function overlimit:city_clamp/place_reward
tellraw @s {"text":"[overlimit] シティクランプは未発生。報酬だけ足元に出した（脅威は変わらない）","color":"gold"}
