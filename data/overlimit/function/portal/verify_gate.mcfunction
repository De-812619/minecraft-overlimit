scoreboard players set #bw_verify_cd overlimit.const 0
execute unless score #bw_gate overlimit.const matches 1 run return fail
execute unless score #bw_sess_x overlimit.const matches -2147483648.. run return run function overlimit:portal/gate_lost
execute store result storage overlimit:portal verify.x int 1 run scoreboard players get #bw_sess_x overlimit.const
execute store result storage overlimit:portal verify.y int 1 run scoreboard players get #bw_sess_y overlimit.const
execute store result storage overlimit:portal verify.z int 1 run scoreboard players get #bw_sess_z overlimit.const
function overlimit:portal/verify_gate_at with storage overlimit:portal verify
