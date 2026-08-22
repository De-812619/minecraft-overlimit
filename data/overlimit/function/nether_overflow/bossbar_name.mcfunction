execute if score #no_phase overlimit.const matches 1 run return run function overlimit:nether_overflow/bossbar_name_set {phase:"WARNING",color:"gold"}
execute if score #no_phase overlimit.const matches 2 run return run function overlimit:nether_overflow/bossbar_name_set {phase:"DANGER",color:"red"}
function overlimit:nether_overflow/bossbar_name_set {phase:"CRISIS",color:"dark_purple"}
