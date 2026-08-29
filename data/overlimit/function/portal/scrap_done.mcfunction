execute unless score #bw_warm overlimit.const matches 1 if data storage overlimit:portal origin.x run function overlimit:portal/unload_origin with storage overlimit:portal origin
execute unless score #bw_warm overlimit.const matches 1 if data storage overlimit:portal pend.x run function overlimit:portal/unload_pend with storage overlimit:portal pend
execute unless score #bw_warm overlimit.const matches 1 run data remove storage overlimit:portal origin
execute unless score #bw_warm overlimit.const matches 1 run data remove storage overlimit:portal pend
scoreboard players set #bw_scrapping overlimit.const 0
