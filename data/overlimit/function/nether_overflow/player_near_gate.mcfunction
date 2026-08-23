data modify storage overlimit:no near set from storage overlimit:no gate
execute store result storage overlimit:no near.r int 1 run scoreboard players get #no_scan_r overlimit.const
return run function overlimit:nether_overflow/player_near_gate_at with storage overlimit:no near
