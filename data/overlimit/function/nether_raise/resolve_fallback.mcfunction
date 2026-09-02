scoreboard players operation #nr_qx overlimit.const = #nr_px overlimit.const
scoreboard players operation #nr_qz overlimit.const = #nr_pz overlimit.const
scoreboard players operation #nr_qk overlimit.const = #nr_kind_id overlimit.const
execute if function overlimit:nether_raise/is_cleared run return fail
function overlimit:nether_raise/store_target
return 1
