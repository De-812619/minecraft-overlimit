function overlimit:omen/capture_bw
scoreboard players operation #bw_omen overlimit.const = #omen_found overlimit.const
execute unless score #bw_omen overlimit.const matches 1 run return fail
execute as @a[tag=overlimit.in_bw] run function overlimit:omen/consume
tellraw @a[tag=overlimit.in_bw] {"text":"不吉な予感がこの夜を歪めた。強化敵はDANGER以上だけ現れ、クリア報酬は2倍になる。","color":"dark_purple"}
