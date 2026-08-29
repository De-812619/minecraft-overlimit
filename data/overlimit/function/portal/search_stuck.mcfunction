# チャンクが載らない。帰り門へ戻し、待ちを解除する。
tellraw @s {"text":"転移先の読み込みに失敗した。もう一度ゲートに入ってください","color":"red"}
execute if predicate overlimit:in_blood_world if score @s overlimit.ow_has matches 1 run function overlimit:portal/return_ow
function overlimit:portal/release
tag @s remove overlimit.portal_arrive
tag @s remove overlimit.to_bw
scoreboard players set @s overlimit.portal_cd 60
scoreboard players set @s overlimit.portal_charge 0
scoreboard players set @s overlimit.portal_wait 0
