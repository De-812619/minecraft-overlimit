# レイズ失敗フラグ: 次の NO だけ脅威指数+1 段で予算・DISASTER を読む
execute if score #nr_fail_boost overlimit.const matches 1 run function overlimit:heat/apply_nr_fail_boost
scoreboard players set #nr_fail_boost overlimit.const 0
