# 先読み中に候補を使い切った。別の未使用構造物を測り直す。
scoreboard players set #bw_rand_n overlimit.const 0
scoreboard players set #bw_place_wait overlimit.const 0
scoreboard players set #bw_spread overlimit.const 0
execute unless function overlimit:portal/pick_landmark run return run function overlimit:portal/preload_cancel
function overlimit:portal/forceload_dest with storage overlimit:portal origin
return 1
