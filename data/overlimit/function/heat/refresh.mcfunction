# #heat (0..5) から BM/NO 用の閾値・予算をセットする
execute if score #heat overlimit.const matches 0 run return run function overlimit:heat/refresh_0
execute if score #heat overlimit.const matches 1 run return run function overlimit:heat/refresh_1
execute if score #heat overlimit.const matches 2 run return run function overlimit:heat/refresh_2
execute if score #heat overlimit.const matches 3 run return run function overlimit:heat/refresh_3
execute if score #heat overlimit.const matches 4 run return run function overlimit:heat/refresh_4
function overlimit:heat/refresh_5
