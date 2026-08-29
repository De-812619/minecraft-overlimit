# アイドル探索を打ち切る。座標は残し、チャージ側に引き継ぐ。
execute if data storage overlimit:portal pend.x run function overlimit:portal/unload_pend with storage overlimit:portal pend
scoreboard players set #bw_warm overlimit.const 0
scoreboard players set #bw_warm_fail overlimit.const 1
scoreboard players set #bw_warm_cd overlimit.const 0
scoreboard players set #bw_preload overlimit.const 0
scoreboard players set #bw_no_tp overlimit.const 0
scoreboard players set #bw_place_wait overlimit.const 0
