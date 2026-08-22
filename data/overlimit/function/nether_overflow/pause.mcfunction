execute if score #no_paused overlimit.const matches 1 run return fail
scoreboard players set #no_paused overlimit.const 1
bossbar set overlimit:nether_overflow players @a[predicate=overlimit:in_overworld]
tellraw @a[predicate=overlimit:in_overworld] {"text":"コア所持者がいなくなった。防衛を一時停止した。","color":"gray"}
