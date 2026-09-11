execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run tellraw @s {"text":"Peacefulでは敵が出ない。Easy以上にしてください。","color":"red"}
scoreboard players set #bw_ended_day overlimit.const -1
execute in overlimit:blood_world run time set 13000
function overlimit:blood_world/clock_resume
function overlimit:blood_world/start
