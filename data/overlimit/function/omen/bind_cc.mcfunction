function overlimit:omen/capture_end
scoreboard players operation #cc_omen overlimit.const = #omen_found overlimit.const
execute unless score #cc_omen overlimit.const matches 1 run return fail
execute as @a[predicate=overlimit:in_the_end] run function overlimit:omen/consume
tellraw @a[predicate=overlimit:in_the_end] {"text":"不吉な予感がカオスを歪めた。強化敵はDANGER以上だけ現れ、クリア報酬は2倍になる。","color":"dark_purple"}
