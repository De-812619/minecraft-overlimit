# 既定は鉄。他は /function overlimit:trim/give_set {mat:"gold"} など
data modify storage overlimit:trim give set value {mat:"iron"}
function overlimit:trim/give_set with storage overlimit:trim give
tellraw @s [{"text":"[overlimit] ","color":"gold"},{"text":"検証: /function overlimit:trim/debug   他の鉱石: /function overlimit:trim/give_set {mat:\"gold\"}","color":"gray"}]
