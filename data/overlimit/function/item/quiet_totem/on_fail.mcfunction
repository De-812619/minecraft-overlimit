tellraw @s {"text":"抑止するイベントがない。静寂のトーテムは消費されなかった。","color":"gray"}
tag @s add overlimit.qt_restore
schedule function overlimit:item/quiet_totem/restore_pulse 1t append
