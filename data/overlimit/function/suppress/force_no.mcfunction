tellraw @a {"translate": "overlimit.cmd.no_suppress","color":"gold"}
execute if score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/netherize_finish
execute if score #no_active overlimit.const matches 1 run function overlimit:nether_overflow/end
function overlimit:suppress/on_success_hook
