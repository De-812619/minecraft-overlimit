# @s = 被弾プレイヤー。DEMON 3部位以上。CD 6秒。攻撃者へ6、範囲KB。
execute if score @s overlimit.cd.ul_demon matches 1.. run return fail
function overlimit:item/unlimited/armor_count
execute unless score #ul_demon overlimit.const matches 3.. run return fail
scoreboard players set @s overlimit.cd.ul_demon 120
tag @s add overlimit.ul.atk
execute on attacker if entity @s[type=#overlimit:hostile] run damage @s 6 minecraft:thorns by @p[tag=overlimit.ul.atk]
tag @s remove overlimit.ul.atk
function overlimit:item/unlimited/armor_burst_demon
