execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run tellraw @s {"text":"Peacefulでは敵が出ない。Easy以上にしてください。","color":"red"}
execute in minecraft:overworld run time set 13000
function overlimit:blood_moon/start
