execute unless score #no_active overlimit.const matches 1 run return fail
tellraw @a[predicate=overlimit:in_overworld] {"text":"ネザーオーバーフローは無効終了した。","color":"gray"}
execute if score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/netherize_finish
function overlimit:nether_overflow/end
