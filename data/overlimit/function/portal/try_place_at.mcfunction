$execute in overlimit:blood_world positioned $(x) 64 $(z) unless loaded ~ ~ ~ run forceload add ~-32 ~-32 ~32 ~32
$execute in overlimit:blood_world positioned $(x) 64 $(z) unless loaded ~ ~ ~ run return fail
$execute in overlimit:blood_world positioned $(x) 64 $(z) if function overlimit:portal/ensure_remote run return run function overlimit:portal/placed
$execute in overlimit:blood_world positioned $(x) 64 $(z) if function overlimit:portal/is_ungenerated if score @s overlimit.portal_wait matches ..149 run return fail
$execute in overlimit:blood_world positioned $(x) 64 $(z) if function overlimit:portal/find_land run return run function overlimit:portal/placed
scoreboard players operation #mod overlimit.const = @s overlimit.portal_wait
scoreboard players operation #mod overlimit.const %= #80 overlimit.const
execute unless score #mod overlimit.const matches 0 run return fail
scoreboard players set #bw_reroll_tick overlimit.const 0
return run function overlimit:portal/search_next
