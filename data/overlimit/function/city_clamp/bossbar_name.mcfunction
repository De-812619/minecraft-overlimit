execute if score #cc_combat overlimit.const matches 0 run return run bossbar set overlimit:city_clamp name {"text":"シティクランプ — 会場へ","color":"blue","bold":true}
execute if score #cc_phase overlimit.const matches 1 run return run function overlimit:city_clamp/bossbar_name_set {phase:"WARNING",color:"blue"}
execute if score #cc_phase overlimit.const matches 2 run return run function overlimit:city_clamp/bossbar_name_set {phase:"DANGER",color:"red"}
function overlimit:city_clamp/bossbar_name_set {phase:"CRISIS",color:"dark_purple"}
