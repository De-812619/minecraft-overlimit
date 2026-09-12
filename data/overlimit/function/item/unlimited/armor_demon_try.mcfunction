# @s = 被弾プレイヤー。魔王が王族より多いときだけ。CD 3秒。攻撃者へ6、範囲KB。
execute if score @s overlimit.cd.ul_demon matches 1.. run return fail
function overlimit:item/unlimited/armor_count
execute unless score #ul_demon overlimit.const > #ul_royal overlimit.const run return fail
scoreboard players set @s overlimit.cd.ul_demon 60
tag @s add overlimit.ul.atk
execute on attacker if entity @s[type=#overlimit:hostile] run damage @s 6 minecraft:thorns by @p[tag=overlimit.ul.atk]
tag @s remove overlimit.ul.atk
function overlimit:item/unlimited/armor_burst_demon
