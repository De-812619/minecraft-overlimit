# {holder:"#stat_bm_wins",event:1}
$scoreboard players add $(holder) overlimit.const 1
$scoreboard players set #reward_event overlimit.const $(event)
function overlimit:stats/refresh_ul_boost
execute if score #ul_boost overlimit.const matches 1 run tellraw @a {"translate":"overlimit.msg.ul.milestone","color":"gold"}
