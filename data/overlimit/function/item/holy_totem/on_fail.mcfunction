tellraw @s {"text":"世界圧はすでに 0 だ。聖王のトーテムは消費されなかった。","color":"gray"}
tag @s add overlimit.ht_restore
schedule function overlimit:item/holy_totem/restore_pulse 1t append
