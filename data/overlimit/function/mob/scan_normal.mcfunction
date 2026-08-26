# 通常: 世界圧で閾値可変（圧0は DISASTER 0.8% / CRISIS 1% / DANGER 5% / WARNING 10%）
execute store result score #roll overlimit.const run random value 0..499
execute if score #roll overlimit.const <= #pr_d_max overlimit.const run return run function overlimit:mob/make_disaster
execute if score #roll overlimit.const <= #pr_c_max overlimit.const run return run function overlimit:mob/make_crisis
execute if score #roll overlimit.const <= #pr_g_max overlimit.const run return run function overlimit:mob/make_danger
execute if score #roll overlimit.const <= #pr_w_max overlimit.const run return run function overlimit:mob/make_warning
