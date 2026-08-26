# フェーズ固定＋ DISASTER 上書き（閾値は #no_dis1/2/3、ヒートで更新）
execute store result score #roll overlimit.const run random value 0..499
execute if score #no_phase overlimit.const matches 1 if score #roll overlimit.const <= #no_dis1 overlimit.const run return run function overlimit:mob/make_disaster
execute if score #no_phase overlimit.const matches 2 if score #roll overlimit.const <= #no_dis2 overlimit.const run return run function overlimit:mob/make_disaster
execute if score #no_phase overlimit.const matches 3 if score #roll overlimit.const <= #no_dis3 overlimit.const run return run function overlimit:mob/make_disaster
execute if score #no_phase overlimit.const matches 1 run return run function overlimit:mob/make_warning
execute if score #no_phase overlimit.const matches 2 run return run function overlimit:mob/make_danger
function overlimit:mob/make_crisis
