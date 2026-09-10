# 忠誠の帰還中だけ。バニラ加速 0.05×忠誠3 の 1.5 倍になるよう、向きへ 0.075 を足す。
execute if data entity @s {inGround:1b} run return fail
execute unless data entity @s {DealtDamage:1b} run return fail
execute on origin run tag @s add overlimit.ul.ret
execute unless entity @e[tag=overlimit.ul.ret,limit=1] run return fail
execute at @s facing entity @e[tag=overlimit.ul.ret,limit=1] eyes positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.ul.tdir"]}
execute store result score #ux overlimit.const run data get entity @n[type=minecraft:marker,tag=overlimit.ul.tdir] Pos[0] 1000
execute store result score #uy overlimit.const run data get entity @n[type=minecraft:marker,tag=overlimit.ul.tdir] Pos[1] 1000
execute store result score #uz overlimit.const run data get entity @n[type=minecraft:marker,tag=overlimit.ul.tdir] Pos[2] 1000
execute store result score #px overlimit.const run data get entity @s Pos[0] 1000
execute store result score #py overlimit.const run data get entity @s Pos[1] 1000
execute store result score #pz overlimit.const run data get entity @s Pos[2] 1000
scoreboard players operation #ux overlimit.const -= #px overlimit.const
scoreboard players operation #uy overlimit.const -= #py overlimit.const
scoreboard players operation #uz overlimit.const -= #pz overlimit.const
scoreboard players operation #ux overlimit.const *= #75 overlimit.const
scoreboard players operation #uy overlimit.const *= #75 overlimit.const
scoreboard players operation #uz overlimit.const *= #75 overlimit.const
scoreboard players operation #ux overlimit.const /= #1000 overlimit.const
scoreboard players operation #uy overlimit.const /= #1000 overlimit.const
scoreboard players operation #uz overlimit.const /= #1000 overlimit.const
execute store result score #mx overlimit.const run data get entity @s Motion[0] 1000
execute store result score #my overlimit.const run data get entity @s Motion[1] 1000
execute store result score #mz overlimit.const run data get entity @s Motion[2] 1000
scoreboard players operation #mx overlimit.const += #ux overlimit.const
scoreboard players operation #my overlimit.const += #uy overlimit.const
scoreboard players operation #mz overlimit.const += #uz overlimit.const
execute store result entity @s Motion[0] double 0.001 run scoreboard players get #mx overlimit.const
execute store result entity @s Motion[1] double 0.001 run scoreboard players get #my overlimit.const
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #mz overlimit.const
kill @e[type=minecraft:marker,tag=overlimit.ul.tdir,distance=..3]
execute on origin run tag @s remove overlimit.ul.ret
