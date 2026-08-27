# locate structure は最寄りしか返さないため、最寄りがクリア済みのときは
# 測量の原点をずらして別の構造物を候補に挙げ、その中から最寄りの未クリアを選ぶ。
# origins[0] は原点ゼロ＝全体の最寄りなので、そこが未クリアならリング探索は不要。
scoreboard players set #cc_ok overlimit.const 0
scoreboard players set #cc_found overlimit.const 0
scoreboard players set #cc_dirty overlimit.const 0
scoreboard players set #cc_bestd overlimit.const 999999
execute store result score #cc_px overlimit.const run data get entity @s Pos[0]
execute store result score #cc_py overlimit.const run data get entity @s Pos[1]
execute store result score #cc_pz overlimit.const run data get entity @s Pos[2]

scoreboard players set #cc_oi overlimit.const 0
execute store result storage overlimit:cc arg.i int 1 run scoreboard players get #cc_oi overlimit.const
function overlimit:city_clamp/scan_pick with storage overlimit:cc arg

execute store result score #cc_olen overlimit.const run data get storage overlimit:cc origins
scoreboard players set #cc_oi overlimit.const 1
execute if score #cc_found overlimit.const matches 0 if score #cc_dirty overlimit.const matches 1 if score #cc_oi overlimit.const < #cc_olen overlimit.const run function overlimit:city_clamp/scan_step
execute if score #cc_found overlimit.const matches 0 run return fail

execute store result storage overlimit:cc target.x int 1 run scoreboard players get #cc_wx overlimit.const
execute store result storage overlimit:cc target.y int 1 run scoreboard players get #cc_py overlimit.const
execute store result storage overlimit:cc target.z int 1 run scoreboard players get #cc_wz overlimit.const
execute store result storage overlimit:cc target.kind_id int 1 run scoreboard players get #cc_kind_id overlimit.const
scoreboard players set #cc_ok overlimit.const 1
