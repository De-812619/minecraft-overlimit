execute unless score #cc_active overlimit.const matches 1 run return fail
tellraw @a[predicate=overlimit:in_the_end] {"text":"シティクランプはPeacefulにより無効終了した。","color":"gray"}
function overlimit:city_clamp/end
