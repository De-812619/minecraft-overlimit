scoreboard players operation #cc_qx overlimit.const = #cc_px overlimit.const
scoreboard players operation #cc_qz overlimit.const = #cc_pz overlimit.const
scoreboard players operation #cc_qk overlimit.const = #cc_kind_id overlimit.const
execute if function overlimit:city_clamp/is_cleared run return fail
function overlimit:city_clamp/store_target
return 1
