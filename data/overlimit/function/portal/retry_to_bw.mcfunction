# 対チャンクが載るまで OW の門で待つ。載ったら送る。
scoreboard players add @s overlimit.portal_wait 1
execute if score @s overlimit.portal_wait matches 1 run function overlimit:portal/hold_player
function overlimit:portal/status_bar
execute if score @s overlimit.portal_wait matches 600.. run return run function overlimit:portal/search_stuck
execute unless score @s overlimit.bw_has matches 1 run function overlimit:portal/dest_from_ow
function overlimit:portal/forceload_bw_dest
function overlimit:portal/try_enter_bw
