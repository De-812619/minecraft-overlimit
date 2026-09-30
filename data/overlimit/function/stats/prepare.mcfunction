# 報酬だけ出すとき。勝利回数は増やさない。{event:1}
$scoreboard players set #reward_event overlimit.const $(event)
function overlimit:stats/refresh_ul_boost
