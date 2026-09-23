$data modify storage overlimit:i18n slot set value "$(slot)"
$execute store result storage overlimit:i18n count int 1 run data get entity @s $(nbt)
execute store result score #i18n_c overlimit.const run data get storage overlimit:i18n count
execute if score #i18n_c overlimit.const matches ..0 run data modify storage overlimit:i18n count set value 1
$loot replace entity @s $(slot) loot $(table)
return run function overlimit:item/i18n_convert/restore_count with storage overlimit:i18n
