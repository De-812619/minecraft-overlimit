# 先に次ティックを予約する。tick 本体が maxCommandChainLength で切れてもループが死なない。
schedule function overlimit:tick_loop 1t replace
function overlimit:tick
