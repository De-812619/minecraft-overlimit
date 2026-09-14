execute store result score #now overlimit.const run time query gametime
execute if score @s overlimit.trim.cu_swing = #now overlimit.const run return fail
scoreboard players operation @s overlimit.trim.cu_swing = #now overlimit.const
scoreboard players set @s overlimit.trim.cu_age 0
execute if predicate overlimit:trim/thunder run return run function overlimit:trim/copper/discharge
scoreboard players add @s overlimit.trim.cu_hits 1
execute if score @s overlimit.trim.cu_hits matches 9.. run return run function overlimit:trim/copper/discharge
function overlimit:trim/copper/charge
