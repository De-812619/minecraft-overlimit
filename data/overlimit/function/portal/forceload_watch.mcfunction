# 転移中以外に pfl が残っていたら即解除。転移中は 30 秒で打ち切る。
execute if entity @s[tag=!overlimit.portal_arrive,tag=!overlimit.to_bw,tag=!overlimit.to_ow] run return run function overlimit:portal/forceload_release
scoreboard players add @s overlimit.pfl_age 1
execute if score @s overlimit.pfl_age matches 600.. run return run function overlimit:portal/search_stuck
return fail
