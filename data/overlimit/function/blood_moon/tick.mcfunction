# ブラッドムーン — 毎tick（オーバーワールドの時計で判定）
function overlimit:blood_moon/read_time

execute unless score #bm_daynow overlimit.const = #bm_day overlimit.const run scoreboard players set #bm_checked overlimit.const 0
execute unless score #bm_daynow overlimit.const = #bm_day overlimit.const run scoreboard players set #no_dusk_checked overlimit.const 0
scoreboard players operation #bm_day overlimit.const = #bm_daynow overlimit.const

execute if score #bm_active overlimit.const matches 1 run function overlimit:blood_moon/tick_active
execute unless score #no_dusk_checked overlimit.const matches 1 if score #bm_tod overlimit.const matches 12000..13000 run function overlimit:nether_overflow/on_dusk
execute unless score #bm_active overlimit.const matches 1 unless score #no_active overlimit.const matches 1 if score #bm_checked overlimit.const matches 0 if score #bm_tod overlimit.const matches 12000..13000 run function overlimit:blood_moon/try_start
