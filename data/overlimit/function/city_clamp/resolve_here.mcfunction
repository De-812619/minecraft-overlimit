# @s = エンドシティ内のプレイヤー。会場は足元、クリア判定は構造物原点（精密 locate 4回）。
execute store result score #cc_px overlimit.const run data get entity @s Pos[0]
execute store result score #cc_py overlimit.const run data get entity @s Pos[1]
execute store result score #cc_pz overlimit.const run data get entity @s Pos[2]
execute store result storage overlimit:cc probe.x int 1 run scoreboard players get #cc_px overlimit.const
execute store result storage overlimit:cc probe.z int 1 run scoreboard players get #cc_pz overlimit.const
data modify storage overlimit:cc probe.kind set from storage overlimit:cc target.kind
scoreboard players set #cc_div overlimit.const 64
function overlimit:city_clamp/probe_near with storage overlimit:cc probe
execute unless function overlimit:city_clamp/solve_offset run return run function overlimit:city_clamp/resolve_fallback
scoreboard players operation #cc_qx overlimit.const = #cc_px overlimit.const
scoreboard players operation #cc_qx overlimit.const += #cc_ox overlimit.const
scoreboard players operation #cc_qz overlimit.const = #cc_pz overlimit.const
scoreboard players operation #cc_qz overlimit.const += #cc_oz overlimit.const
scoreboard players operation #cc_qk overlimit.const = #cc_kind_id overlimit.const
execute if function overlimit:city_clamp/is_cleared run return fail
function overlimit:city_clamp/store_target
return 1
