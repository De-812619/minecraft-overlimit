# @s = overlimit.blood_moon 個体。死亡アニメ中（Health 0）なら加点する。
execute if entity @s[tag=overlimit.bm_scored] run return fail

scoreboard players set #bm_hp overlimit.const 0
execute store result score #bm_hp overlimit.const run data get entity @s Health 10
execute if score #bm_hp overlimit.const matches 1.. run return fail

tag @s add overlimit.bm_scored
scoreboard players set #bm_add overlimit.const 1
execute if entity @s[tag=overlimit.crisis] run scoreboard players set #bm_add overlimit.const 3
scoreboard players operation #bm_kills overlimit.const += #bm_add overlimit.const
function overlimit:blood_moon/bossbar_name
execute if score #bm_kills overlimit.const matches 100.. run function overlimit:blood_moon/end_victory
