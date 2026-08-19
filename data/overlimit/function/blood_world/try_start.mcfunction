execute unless entity @a[tag=overlimit.in_bw,gamemode=!spectator] run return fail
execute unless score #bm_tod overlimit.const matches 12000..23459 run return fail
execute if score #bw_ended_day overlimit.const = #bm_daynow overlimit.const run return fail
function overlimit:blood_world/start
