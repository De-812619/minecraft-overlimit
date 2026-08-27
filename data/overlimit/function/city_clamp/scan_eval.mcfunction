scoreboard players set #cc_div overlimit.const 256
execute unless function overlimit:city_clamp/solve_offset run return fail
scoreboard players operation #cc_qx overlimit.const = #cc_px overlimit.const
scoreboard players operation #cc_qx overlimit.const += #cc_offx overlimit.const
scoreboard players operation #cc_qx overlimit.const += #cc_ox overlimit.const
scoreboard players operation #cc_qz overlimit.const = #cc_pz overlimit.const
scoreboard players operation #cc_qz overlimit.const += #cc_offz overlimit.const
scoreboard players operation #cc_qz overlimit.const += #cc_oz overlimit.const
# 粗探査の誤差はクリア済み判定の48マスを超えうるので、詰めてから判定する
execute store result storage overlimit:cc probe.x int 1 run scoreboard players get #cc_qx overlimit.const
execute store result storage overlimit:cc probe.z int 1 run scoreboard players get #cc_qz overlimit.const
data modify storage overlimit:cc probe.kind set from storage overlimit:cc target.kind
function overlimit:city_clamp/probe_near with storage overlimit:cc probe
scoreboard players set #cc_div overlimit.const 64
execute unless function overlimit:city_clamp/solve_offset run return fail
scoreboard players operation #cc_qx overlimit.const += #cc_ox overlimit.const
scoreboard players operation #cc_qz overlimit.const += #cc_oz overlimit.const
scoreboard players operation #cc_qk overlimit.const = #cc_kind_id overlimit.const
execute if function overlimit:city_clamp/is_cleared run return run scoreboard players set #cc_dirty overlimit.const 1
scoreboard players operation #cc_sdx overlimit.const = #cc_qx overlimit.const
scoreboard players operation #cc_sdx overlimit.const -= #cc_px overlimit.const
scoreboard players operation #cc_sdz overlimit.const = #cc_qz overlimit.const
scoreboard players operation #cc_sdz overlimit.const -= #cc_pz overlimit.const
execute if score #cc_sdx overlimit.const matches ..-1 run scoreboard players operation #cc_sdx overlimit.const *= #-1 overlimit.const
execute if score #cc_sdz overlimit.const matches ..-1 run scoreboard players operation #cc_sdz overlimit.const *= #-1 overlimit.const
scoreboard players operation #cc_smax overlimit.const = #cc_sdx overlimit.const
scoreboard players operation #cc_smin overlimit.const = #cc_sdz overlimit.const
execute if score #cc_sdz overlimit.const > #cc_sdx overlimit.const run scoreboard players operation #cc_smax overlimit.const = #cc_sdz overlimit.const
execute if score #cc_sdz overlimit.const > #cc_sdx overlimit.const run scoreboard players operation #cc_smin overlimit.const = #cc_sdx overlimit.const
scoreboard players operation #cc_smin overlimit.const *= #3 overlimit.const
scoreboard players operation #cc_smin overlimit.const /= #8 overlimit.const
scoreboard players operation #cc_sd overlimit.const = #cc_smax overlimit.const
scoreboard players operation #cc_sd overlimit.const += #cc_smin overlimit.const
execute if score #cc_sd overlimit.const > #cc_search overlimit.const run return fail
execute unless score #cc_sd overlimit.const < #cc_bestd overlimit.const run return fail
scoreboard players operation #cc_bestd overlimit.const = #cc_sd overlimit.const
scoreboard players operation #cc_wx overlimit.const = #cc_qx overlimit.const
scoreboard players operation #cc_wz overlimit.const = #cc_qz overlimit.const
scoreboard players set #cc_found overlimit.const 1
