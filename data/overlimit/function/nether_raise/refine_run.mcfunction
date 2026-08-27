# locate structure は最寄りしか返さないため、最寄りがクリア済みのときは
# 測量の原点をずらして別の構造物を候補に挙げ、その中から最寄りの未クリアを選ぶ。
# 要塞と砦の2種類があるので、どちらも候補に入れて距離で比較する。
scoreboard players set #nr_ok overlimit.const 0
scoreboard players set #nr_found overlimit.const 0
scoreboard players set #nr_dirty overlimit.const 0
scoreboard players set #nr_bestd overlimit.const 999999
execute store result score #nr_px overlimit.const run data get entity @s Pos[0]
execute store result score #nr_py overlimit.const run data get entity @s Pos[1]
execute store result score #nr_pz overlimit.const run data get entity @s Pos[2]

data modify storage overlimit:nr scan_kind set value "minecraft:fortress"
scoreboard players set #nr_skid overlimit.const 1
scoreboard players set #nr_oi overlimit.const 0
function overlimit:nether_raise/scan_pick_idx
data modify storage overlimit:nr scan_kind set value "minecraft:bastion_remnant"
scoreboard players set #nr_skid overlimit.const 2
scoreboard players set #nr_oi overlimit.const 0
function overlimit:nether_raise/scan_pick_idx

execute store result score #nr_olen overlimit.const run data get storage overlimit:nr origins
execute if score #nr_dirty overlimit.const matches 1 run function overlimit:nether_raise/scan_ring
execute if score #nr_found overlimit.const matches 0 run return fail

scoreboard players operation #nr_kind_id overlimit.const = #nr_wkid overlimit.const
data modify storage overlimit:nr target.kind set from storage overlimit:nr win_kind
execute store result storage overlimit:nr target.x int 1 run scoreboard players get #nr_wx overlimit.const
execute store result storage overlimit:nr target.y int 1 run scoreboard players get #nr_py overlimit.const
execute store result storage overlimit:nr target.z int 1 run scoreboard players get #nr_wz overlimit.const
execute store result storage overlimit:nr target.kind_id int 1 run scoreboard players get #nr_kind_id overlimit.const
scoreboard players set #nr_ok overlimit.const 1
