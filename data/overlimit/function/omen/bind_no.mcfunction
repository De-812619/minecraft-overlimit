function overlimit:omen/capture_ow
scoreboard players operation #no_omen overlimit.const = #omen_found overlimit.const
execute unless score #no_omen overlimit.const matches 1 run return fail
execute as @a[predicate=overlimit:in_overworld] run function overlimit:omen/consume
tellraw @a[predicate=overlimit:in_overworld] {"text":"不吉な予感がオーバーフローを歪めた。強化敵はDANGER以上だけ現れ、クリア報酬は2倍になる。","color":"dark_purple"}
