execute if score #nr_combat overlimit.const matches 0 run return run bossbar set overlimit:nether_raise name {"text":"ネザーレイズ — 戦場へ","color":"gold","bold":true}
execute if score #nr_phase overlimit.const matches 1 run return run function overlimit:nether_raise/bossbar_name_set {phase:"WARNING",color:"gold"}
execute if score #nr_phase overlimit.const matches 2 run return run function overlimit:nether_raise/bossbar_name_set {phase:"DANGER",color:"red"}
function overlimit:nether_raise/bossbar_name_set {phase:"CRISIS",color:"dark_purple"}
