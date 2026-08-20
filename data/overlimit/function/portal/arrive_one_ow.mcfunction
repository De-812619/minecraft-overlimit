execute unless loaded ~ ~ ~ run return fail
execute unless entity @e[type=minecraft:marker,tag=overlimit.bw_fl,distance=..4] run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.bw_fl"]}
execute if function overlimit:portal/ensure run return run function overlimit:portal/arrive_done
scoreboard players add @s overlimit.portal_wait 1
execute if score @s overlimit.portal_wait matches 150.. run return run function overlimit:portal/arrive_fallback
