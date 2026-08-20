# 長時間見つからない。待ちを解除して門を再び使えるようにする。
tellraw @s {"text":"転移先が見つからなかった。もう一度ゲートに入ってください","color":"red"}
tag @s remove overlimit.portal_arrive
tag @s remove overlimit.to_bw
scoreboard players set @s overlimit.portal_cd 0
scoreboard players set @s overlimit.portal_charge 0
scoreboard players set @s overlimit.portal_wait 0
execute unless entity @a[tag=overlimit.portal_arrive] run scoreboard players set #bw_pending overlimit.const 0
