# 既定は鉄。他は /function overlimit:trim/give_set {mat:"gold"} など
data modify storage overlimit:trim give set value {mat:"iron"}
function overlimit:trim/give_set with storage overlimit:trim give
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.trim_test","color":"gray"}]
