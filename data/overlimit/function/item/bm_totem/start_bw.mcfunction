execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run tellraw @s {"translate": "overlimit.msg.omen_totem.peaceful","color":"red"}
scoreboard players set #bw_ended_day overlimit.const -1
execute in overlimit:blood_world run time set 13000
function overlimit:blood_world/clock_resume
function overlimit:blood_world/start
