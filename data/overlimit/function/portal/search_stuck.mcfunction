# 長時間見つからない。海上に残さず帰り門へ戻し、待ちを解除する。
# 失敗した測量座標が used に残ると、再入場でも同じ最寄りを弾いて即失敗する。
data modify storage overlimit:portal used set value []
tellraw @s {"text":"転移先が見つからなかった。もう一度ゲートに入ってください","color":"red"}
execute if predicate overlimit:in_blood_world if score @s overlimit.ow_has matches 1 run function overlimit:portal/return_ow
function overlimit:portal/release
tag @s remove overlimit.portal_arrive
tag @s remove overlimit.to_bw
scoreboard players set @s overlimit.portal_cd 60
scoreboard players set @s overlimit.portal_charge 0
scoreboard players set @s overlimit.portal_wait 0
execute unless entity @a[tag=overlimit.portal_arrive] run scoreboard players set #bw_pending overlimit.const 0
