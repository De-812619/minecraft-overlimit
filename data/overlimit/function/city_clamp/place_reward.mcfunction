data modify storage overlimit:reward fn set value "overlimit:city_clamp/try_chest_spot"
data modify storage overlimit:reward give set value "overlimit:city_clamp/give_fallback"
return run function overlimit:reward/scan_chest_spots with storage overlimit:reward
