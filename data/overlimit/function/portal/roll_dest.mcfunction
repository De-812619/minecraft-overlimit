# 原点 ±2000 を抽選し、pend に入れる。
scoreboard players operation #ox overlimit.const = #bw_spawn_x overlimit.const
scoreboard players operation #oz overlimit.const = #bw_spawn_z overlimit.const
execute if score #bw_origin_from_gate overlimit.const matches 1 run scoreboard players operation #ox overlimit.const = #bw_origin_x overlimit.const
execute if score #bw_origin_from_gate overlimit.const matches 1 run scoreboard players operation #oz overlimit.const = #bw_origin_z overlimit.const
execute store result score #dx overlimit.const run random value -2000..2000
execute store result score #dz overlimit.const run random value -2000..2000
scoreboard players operation #ox overlimit.const += #dx overlimit.const
scoreboard players operation #oz overlimit.const += #dz overlimit.const
execute store result storage overlimit:portal pend.x int 1 run scoreboard players get #ox overlimit.const
execute store result storage overlimit:portal pend.z int 1 run scoreboard players get #oz overlimit.const
data modify storage overlimit:portal pend.y set value 180
data modify storage overlimit:portal pend.dim set value "overlimit:blood_world"
