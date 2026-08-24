# フェーズ固定＋ DISASTER 上書き（Ph1 0.8% / Ph2 4% / Ph3 8%）
execute store result score #roll overlimit.const run random value 0..499
execute if score #no_phase overlimit.const matches 1 if score #roll overlimit.const matches 0..3 run return run function overlimit:mob/make_disaster
execute if score #no_phase overlimit.const matches 2 if score #roll overlimit.const matches 0..19 run return run function overlimit:mob/make_disaster
execute if score #no_phase overlimit.const matches 3 if score #roll overlimit.const matches 0..39 run return run function overlimit:mob/make_disaster
execute if score #no_phase overlimit.const matches 1 run return run function overlimit:mob/make_warning
execute if score #no_phase overlimit.const matches 2 run return run function overlimit:mob/make_danger
function overlimit:mob/make_crisis
