scoreboard players set @s overlimit.trim.iron 0
scoreboard players set @s overlimit.trim.gold 0
scoreboard players set @s overlimit.trim.diamond 0
scoreboard players set @s overlimit.trim.netherite 0
scoreboard players set @s overlimit.trim.copper 0
scoreboard players set @s overlimit.trim.redstone 0
scoreboard players set @s overlimit.trim.lapis 0
scoreboard players set @s overlimit.trim.emerald 0
scoreboard players set @s overlimit.trim.amethyst 0
scoreboard players set @s overlimit.trim.quartz 0
scoreboard players set @s overlimit.trim.resin 0
data modify storage overlimit:trim slot set value "head"
function overlimit:trim/count_slot with storage overlimit:trim
data modify storage overlimit:trim slot set value "chest"
function overlimit:trim/count_slot with storage overlimit:trim
data modify storage overlimit:trim slot set value "legs"
function overlimit:trim/count_slot with storage overlimit:trim
data modify storage overlimit:trim slot set value "feet"
function overlimit:trim/count_slot with storage overlimit:trim
