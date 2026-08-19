# @s = elite XP Marker。ホスト死亡（または旅客が外れた死亡tick）で撃破点。
execute unless score #bw_active overlimit.const matches 1 run return fail
execute unless entity @s[tag=overlimit.bm_xp] run return fail
execute if entity @s[tag=overlimit.bm_credited] run return fail

scoreboard players set #bm_veh overlimit.const 0
scoreboard players set #host_hp overlimit.const 0
execute on vehicle run scoreboard players set #bm_veh overlimit.const 1
execute on vehicle store result score #host_hp overlimit.const run data get entity @s Health 10
execute if score #bm_veh overlimit.const matches 1 if score #host_hp overlimit.const matches 1.. run return fail
execute if score #bm_veh overlimit.const matches 0 unless entity @s[tag=overlimit.xp_had_host] run return fail

tag @s add overlimit.bm_credited
execute on vehicle run tag @s add overlimit.bm_scored
scoreboard players set #bm_add overlimit.const 1
execute if entity @s[tag=overlimit.xp_crisis] run scoreboard players set #bm_add overlimit.const 3
scoreboard players operation #bw_kills overlimit.const += #bm_add overlimit.const
function overlimit:blood_world/bossbar_name
execute if score #bw_kills overlimit.const matches 100.. run function overlimit:blood_world/end_victory
