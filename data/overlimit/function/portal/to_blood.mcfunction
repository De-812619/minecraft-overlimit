# この OW 門と 1:1。先に対座標を載せてから送る（上空で生成待ちしない）。
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
function overlimit:portal/dest_from_ow
function overlimit:portal/forceload_bw_dest
function overlimit:portal/try_enter_bw
function overlimit:portal/hold_player
function overlimit:portal/status_bar
schedule function overlimit:portal/arrive 1t replace
