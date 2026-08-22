# ネザーオーバーフロー — 毎tick（オーバーワールド）
function overlimit:nether_overflow/register_tick
function overlimit:nether_overflow/prune_gates
execute if score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/netherize_tick
execute if score #no_active overlimit.const matches 1 run function overlimit:nether_overflow/tick_active
