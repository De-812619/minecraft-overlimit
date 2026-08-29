$execute in overlimit:blood_world positioned $(x) $(y) $(z) run forceload add ~-48 ~-48 ~48 ~48
$execute in overlimit:blood_world positioned $(x) $(y) $(z) if loaded ~ ~ ~ run return run function overlimit:portal/scrap_queued_finish
scoreboard players add #bw_scrap_wait overlimit.const 1
execute if score #bw_scrap_wait overlimit.const matches 80.. run return run function overlimit:portal/scrap_queued_give_up
schedule function overlimit:portal/scrap_queued_retry 2t
