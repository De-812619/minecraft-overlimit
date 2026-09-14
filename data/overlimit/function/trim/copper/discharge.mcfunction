scoreboard players set @s overlimit.trim.cu_hits 0
scoreboard players set @s overlimit.trim.cu_age 0
execute if entity @e[type=#overlimit:hostile,tag=!overlimit.summon,distance=..8] at @n[type=#overlimit:hostile,tag=!overlimit.summon,distance=..8] run return run function overlimit:trim/copper/blast
function overlimit:trim/copper/blast
