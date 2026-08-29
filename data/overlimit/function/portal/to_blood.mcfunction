execute if score #bw_gate overlimit.const matches 1 run function overlimit:portal/verify_gate
execute if score #bw_gate overlimit.const matches 1 run return run function overlimit:portal/to_bw_gate
execute if score #bw_pending overlimit.const matches 1 run return run function overlimit:portal/to_bw_pending
function overlimit:portal/to_blood_new
