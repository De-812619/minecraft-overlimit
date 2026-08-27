# 原点 ±10000 を抽選し、origin / pend に入れる。
execute unless score #bw_spawn_x overlimit.const matches -2147483648.. run scoreboard players set #bw_spawn_x overlimit.const 0
execute unless score #bw_spawn_z overlimit.const matches -2147483648.. run scoreboard players set #bw_spawn_z overlimit.const 0
scoreboard players operation #ox overlimit.const = #bw_spawn_x overlimit.const
scoreboard players operation #oz overlimit.const = #bw_spawn_z overlimit.const
execute if score #bw_origin_from_gate overlimit.const matches 1 run scoreboard players operation #ox overlimit.const = #bw_origin_x overlimit.const
execute if score #bw_origin_from_gate overlimit.const matches 1 run scoreboard players operation #oz overlimit.const = #bw_origin_z overlimit.const
execute store result score #dx overlimit.const run random value -10000..10000
execute store result score #dz overlimit.const run random value -10000..10000
scoreboard players operation #ox overlimit.const += #dx overlimit.const
scoreboard players operation #oz overlimit.const += #dz overlimit.const
data modify storage overlimit:portal origin.x set value 0
data modify storage overlimit:portal origin.z set value 0
execute store result storage overlimit:portal origin.x int 1 run scoreboard players get #ox overlimit.const
execute store result storage overlimit:portal origin.z int 1 run scoreboard players get #oz overlimit.const
execute store result storage overlimit:portal pend.x int 1 run scoreboard players get #ox overlimit.const
execute store result storage overlimit:portal pend.z int 1 run scoreboard players get #oz overlimit.const
data modify storage overlimit:portal pend.y set value 180
data modify storage overlimit:portal pend.dim set value "overlimit:blood_world"
