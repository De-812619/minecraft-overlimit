# ゲートセッションと forceload を捨てる。BWフォルダ削除後に一度実行する。
scoreboard players set #bw_gate overlimit.const 0
scoreboard players set #bw_pending overlimit.const 0
scoreboard players set #bw_preload overlimit.const 0
scoreboard players set #bw_warm overlimit.const 0
scoreboard players set #bw_warm_fail overlimit.const 0
scoreboard players set #bw_sess overlimit.const 0
scoreboard players set #bw_occupied overlimit.const 0
scoreboard players set #bw_spread overlimit.const 0
scoreboard players set #bw_scrapping overlimit.const 0
scoreboard players set #bw_place_wait overlimit.const 0
scoreboard players set #bw_rand_n overlimit.const 0
scoreboard players set #bw_survey_ok overlimit.const 0
data remove storage overlimit:portal origin
data remove storage overlimit:portal pend
data remove storage overlimit:portal landmark
data modify storage overlimit:portal gates set value []
data modify storage overlimit:portal used set value []
data modify storage overlimit:portal scrap_queue set value []
tag @a remove overlimit.portal_arrive
tag @a remove overlimit.to_bw
tag @a remove overlimit.to_ow
execute as @a run function overlimit:portal/release
scoreboard players set @a overlimit.portal_charge 0
scoreboard players set @a overlimit.portal_wait 0
scoreboard players set @a overlimit.portal_cd 40
execute in overlimit:blood_world run forceload remove all
kill @e[type=minecraft:marker,tag=overlimit.bw_fl]
kill @e[type=minecraft:armor_stand,tag=overlimit.bw_search]
tellraw @a {"text":"[overlimit] ブラッドワールドのゲート状態を初期化した","color":"gray"}
