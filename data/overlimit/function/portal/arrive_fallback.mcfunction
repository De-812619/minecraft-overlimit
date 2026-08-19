# 海には置かない。チャンクが揃ったあとも陸地がなければ spreadplayers、それでもだめなら終わる。
execute if function overlimit:portal/find_land run return run function overlimit:portal/arrive_done
execute store success score #land_sp overlimit.const run spreadplayers ~ ~ 8 160 false @s
execute if score #land_sp overlimit.const matches 1 at @s if function overlimit:portal/try_land run return run function overlimit:portal/arrive_done
tellraw @s {"text":"[overlimit] 近くに陸地がなかった。別の場所のゲートから入ってください","color":"red"}
function overlimit:portal/arrive_done
