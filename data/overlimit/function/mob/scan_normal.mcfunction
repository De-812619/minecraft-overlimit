# 通常: 世界圧で閾値可変（圧0は DISASTER 出現なし / CRISIS 出現なし / DANGER 0.8% / WARNING 16.8%）
# イベント中（ネザーオーバーフロー/ネザーレイズ/シティクランプ/ブラッドムーン）はDISASTER出現を抑制
execute store result score #roll overlimit.const run random value 0..499
execute unless score #no_active overlimit.const matches 1 unless score #nr_active overlimit.const matches 1 unless score #cc_active overlimit.const matches 1 unless score #bm_active overlimit.const matches 1 if score #roll overlimit.const <= #pr_d_max overlimit.const run return run function overlimit:mob/make_disaster
execute if score #roll overlimit.const <= #pr_c_max overlimit.const run return run function overlimit:mob/make_crisis
execute if score #roll overlimit.const <= #pr_g_max overlimit.const run return run function overlimit:mob/make_danger
execute if score #roll overlimit.const <= #pr_w_max overlimit.const run return run function overlimit:mob/make_warning
