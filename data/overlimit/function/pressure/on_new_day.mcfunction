# 日付更新: 放置3日で +1。勝利した夜／BM朝終了ですでに加算した夜明けは数えない
execute if score #pressure_day overlimit.const = #bm_daynow overlimit.const run return fail
scoreboard players operation #pressure_day overlimit.const = #bm_daynow overlimit.const
execute if score #pressure_won_day overlimit.const = #bm_day overlimit.const run return fail
execute if score #pressure_skip_day overlimit.const = #bm_day overlimit.const run return fail
scoreboard players add #pressure_idle overlimit.const 1
execute if score #pressure_idle overlimit.const < #pressure_idle_need overlimit.const run return fail
scoreboard players set #pressure_idle overlimit.const 0
function overlimit:pressure/add_1
