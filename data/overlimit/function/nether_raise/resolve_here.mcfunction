# @s = 構造物内のプレイヤー。会場は足元、クリア判定は構造物原点（精密 locate 4回）。
execute store result score #nr_px overlimit.const run data get entity @s Pos[0]
execute store result score #nr_py overlimit.const run data get entity @s Pos[1]
execute store result score #nr_pz overlimit.const run data get entity @s Pos[2]
execute store result storage overlimit:nr probe.x int 1 run scoreboard players get #nr_px overlimit.const
execute store result storage overlimit:nr probe.z int 1 run scoreboard players get #nr_pz overlimit.const
data modify storage overlimit:nr probe.kind set from storage overlimit:nr target.kind
scoreboard players set #nr_div overlimit.const 64
function overlimit:nether_raise/probe_near with storage overlimit:nr probe
execute unless function overlimit:nether_raise/solve_offset run return run function overlimit:nether_raise/resolve_fallback
scoreboard players operation #nr_qx overlimit.const = #nr_px overlimit.const
scoreboard players operation #nr_qx overlimit.const += #nr_ox overlimit.const
scoreboard players operation #nr_qz overlimit.const = #nr_pz overlimit.const
scoreboard players operation #nr_qz overlimit.const += #nr_oz overlimit.const
scoreboard players operation #nr_qk overlimit.const = #nr_kind_id overlimit.const
execute if function overlimit:nether_raise/is_cleared run return fail
function overlimit:nether_raise/store_target
return 1
