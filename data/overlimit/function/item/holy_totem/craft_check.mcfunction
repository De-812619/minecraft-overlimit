tag @s remove overlimit.ht_craft
execute if entity @s[tag=overlimit.ht_ok] run return run tag @s remove overlimit.ht_ok
function overlimit:item/holy_totem/craft_reject
