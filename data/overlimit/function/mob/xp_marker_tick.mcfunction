# 乗っているMobが生きている間は待つ。
# 死亡アニメ中も車両は残るため、消滅待ちだとオーブが先に拾われて倍率されない。
execute on vehicle run tag @s add overlimit.xp_had_host
scoreboard players set #host_hp overlimit.const 0
execute on vehicle store result score #host_hp overlimit.const run data get entity @s Health
execute if score #host_hp overlimit.const matches 1.. run return fail

# 初回だけだと、死亡アニメ中の端数HPで弾かれた撃破が二度と入らない
execute if entity @s[tag=overlimit.bm_xp,tag=!overlimit.bm_credited] run function overlimit:blood_moon/credit_from_xp

scoreboard players add @s overlimit.xp_wait 1
execute if score @s overlimit.xp_wait matches 1..2 at @s run function overlimit:mob/boost_xp_orbs
execute if score @s overlimit.xp_wait matches 1..2 on vehicle at @s run function overlimit:mob/boost_xp_orbs
execute if score @s overlimit.xp_wait matches 3.. if entity @s[tag=!overlimit.bm_xp] run kill @s
execute if score @s overlimit.xp_wait matches 3.. if entity @s[tag=overlimit.bm_credited] run kill @s
execute if score @s overlimit.xp_wait matches 10.. run kill @s
