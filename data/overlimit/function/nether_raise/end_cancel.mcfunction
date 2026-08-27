execute unless score #nr_active overlimit.const matches 1 run return fail
tellraw @a[predicate=overlimit:in_nether] {"text":"ネザーレイズはPeacefulにより無効終了した。","color":"gray"}
function overlimit:nether_raise/end
