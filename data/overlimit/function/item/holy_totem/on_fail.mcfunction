tellraw @s {"translate": "overlimit.msg.holy.fail","color":"gray"}
tag @s add overlimit.ht_restore
schedule function overlimit:item/holy_totem/restore_pulse 1t append
