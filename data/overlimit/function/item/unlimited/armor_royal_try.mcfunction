# @s = 被弾プレイヤー。HERO 3部位以上。CD 6秒。回復3、余剰は捨てる。範囲KB。
execute if score @s overlimit.cd.ul_royal matches 1.. run return fail
function overlimit:item/unlimited/armor_count
execute unless score #ul_royal overlimit.const matches 3.. run return fail
scoreboard players set @s overlimit.cd.ul_royal 120
function overlimit:item/unlimited/armor_heal_6
function overlimit:item/unlimited/armor_burst_royal
