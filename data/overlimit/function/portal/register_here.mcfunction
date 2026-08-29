# 門マーカーはブロック中心（n+0.5）にいる。整数は床（align xyz）で保存する。
# data get の切り捨ては 0 方向なので、負座標だと残骸撤去が1マスずれる。
data modify storage overlimit:portal gates append value {x:0,y:0,z:0}
execute at @s align xyz run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.reg"]}
execute as @n[type=minecraft:marker,tag=overlimit.reg] run function overlimit:portal/register_store
