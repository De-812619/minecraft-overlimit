scoreboard players set #nr_div overlimit.const 256
execute unless function overlimit:nether_raise/solve_offset run return fail
scoreboard players operation #nr_qx overlimit.const = #nr_px overlimit.const
scoreboard players operation #nr_qx overlimit.const += #nr_offx overlimit.const
scoreboard players operation #nr_qx overlimit.const += #nr_ox overlimit.const
scoreboard players operation #nr_qz overlimit.const = #nr_pz overlimit.const
scoreboard players operation #nr_qz overlimit.const += #nr_offz overlimit.const
scoreboard players operation #nr_qz overlimit.const += #nr_oz overlimit.const
# 粗探査の誤差はクリア済み判定の48マスを超えうるので、詰めてから判定する
execute store result storage overlimit:nr probe.x int 1 run scoreboard players get #nr_qx overlimit.const
execute store result storage overlimit:nr probe.z int 1 run scoreboard players get #nr_qz overlimit.const
data modify storage overlimit:nr probe.kind set from storage overlimit:nr scan_kind
function overlimit:nether_raise/probe_near with storage overlimit:nr probe
scoreboard players set #nr_div overlimit.const 64
execute unless function overlimit:nether_raise/solve_offset run return fail
scoreboard players operation #nr_qx overlimit.const += #nr_ox overlimit.const
scoreboard players operation #nr_qz overlimit.const += #nr_oz overlimit.const
scoreboard players operation #nr_qk overlimit.const = #nr_skid overlimit.const
execute if function overlimit:nether_raise/is_cleared run return run scoreboard players set #nr_dirty overlimit.const 1
scoreboard players operation #nr_sdx overlimit.const = #nr_qx overlimit.const
scoreboard players operation #nr_sdx overlimit.const -= #nr_px overlimit.const
scoreboard players operation #nr_sdz overlimit.const = #nr_qz overlimit.const
scoreboard players operation #nr_sdz overlimit.const -= #nr_pz overlimit.const
execute if score #nr_sdx overlimit.const matches ..-1 run scoreboard players operation #nr_sdx overlimit.const *= #-1 overlimit.const
execute if score #nr_sdz overlimit.const matches ..-1 run scoreboard players operation #nr_sdz overlimit.const *= #-1 overlimit.const
scoreboard players operation #nr_smax overlimit.const = #nr_sdx overlimit.const
scoreboard players operation #nr_smin overlimit.const = #nr_sdz overlimit.const
execute if score #nr_sdz overlimit.const > #nr_sdx overlimit.const run scoreboard players operation #nr_smax overlimit.const = #nr_sdz overlimit.const
execute if score #nr_sdz overlimit.const > #nr_sdx overlimit.const run scoreboard players operation #nr_smin overlimit.const = #nr_sdx overlimit.const
scoreboard players operation #nr_smin overlimit.const *= #3 overlimit.const
scoreboard players operation #nr_smin overlimit.const /= #8 overlimit.const
scoreboard players operation #nr_sd overlimit.const = #nr_smax overlimit.const
scoreboard players operation #nr_sd overlimit.const += #nr_smin overlimit.const
execute if score #nr_sd overlimit.const > #nr_search overlimit.const run return fail
execute unless score #nr_sd overlimit.const < #nr_bestd overlimit.const run return fail
scoreboard players operation #nr_bestd overlimit.const = #nr_sd overlimit.const
scoreboard players operation #nr_wx overlimit.const = #nr_qx overlimit.const
scoreboard players operation #nr_wz overlimit.const = #nr_qz overlimit.const
scoreboard players operation #nr_wkid overlimit.const = #nr_skid overlimit.const
data modify storage overlimit:nr win_kind set from storage overlimit:nr scan_kind
scoreboard players set #nr_found overlimit.const 1
