# ブラッドワールド — 毎tick（このディメンションの時計で判定）
weather clear 1000000
function overlimit:blood_moon/read_time

execute if score #bw_active overlimit.const matches 1 run function overlimit:blood_world/tick_active
execute unless score #bw_active overlimit.const matches 1 run function overlimit:blood_world/try_start
