# 装備スロット（if items）だけ見る。equipment NBT は手着脱とずれる。
$execute if items entity @s armor.$(slot) *[minecraft:trim~{material:"minecraft:$(mat)"}] run scoreboard players add @s overlimit.trim.$(mat) 1
