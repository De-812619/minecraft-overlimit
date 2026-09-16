tellraw @s {"translate": "overlimit.msg.quiet.fail","color":"gray"}
tag @s add overlimit.qt_restore
schedule function overlimit:item/quiet_totem/restore_pulse 1t append
