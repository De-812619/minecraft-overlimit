tag @s remove overlimit.reforge_craft
execute if entity @s[tag=overlimit.reforge_ban] run return run function overlimit:item/reforge/reject_unlimited
execute if entity @s[tag=overlimit.reforge_ok] run return run function overlimit:item/reforge/success
return run function overlimit:item/reforge/reject
