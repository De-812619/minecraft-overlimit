tellraw @a {"text":"[overlimit] ネザーオーバーフローを抑止終了した（デバッグ・ネザー化なし）","color":"gold"}
execute if score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/netherize_finish
execute if score #no_active overlimit.const matches 1 run function overlimit:nether_overflow/end
function overlimit:suppress/on_success_hook
