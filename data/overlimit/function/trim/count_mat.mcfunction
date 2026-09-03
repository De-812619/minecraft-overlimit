$execute if items entity @s armor.$(slot) *[minecraft:trim~{material:"minecraft:$(mat)"}] run return run scoreboard players add @s overlimit.trim.$(mat) 1
$execute if data entity @s equipment.$(slot).components."minecraft:trim"{material:"minecraft:$(mat)"} run scoreboard players add @s overlimit.trim.$(mat) 1
