function overlimit:omen/capture_nether
scoreboard players operation #nr_omen overlimit.const = #omen_found overlimit.const
execute unless score #nr_omen overlimit.const matches 1 run return fail
execute as @a[predicate=overlimit:in_nether] run function overlimit:omen/consume
tellraw @a[predicate=overlimit:in_nether] {"text":"不吉な予感が蜂起を歪めた。強化敵はDANGER以上だけ現れ、クリア報酬は2倍になる。","color":"dark_purple"}
