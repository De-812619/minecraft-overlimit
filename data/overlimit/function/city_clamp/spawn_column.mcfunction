execute store result score #cc_ty overlimit.const run data get entity @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] Pos[1]
execute unless loaded ~ ~ ~ run return fail
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.cc_yh"]}
execute store result score #cc_coly overlimit.const run data get entity @n[type=minecraft:marker,tag=overlimit.cc_yh] Pos[1]
kill @e[type=minecraft:marker,tag=overlimit.cc_yh,distance=..1]
scoreboard players operation #cc_dy overlimit.const = #cc_coly overlimit.const
scoreboard players operation #cc_dy overlimit.const -= #cc_ty overlimit.const
execute if score #cc_dy overlimit.const matches 9.. run return fail
execute if score #cc_dy overlimit.const matches ..-9 run return fail
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute if score #cc_spawned overlimit.const >= #cc_budget overlimit.const run return fail
scoreboard players set #cc_near_lim overlimit.const 24
execute unless function overlimit:city_clamp/near_ok run return fail
execute if score #cc_phase overlimit.const matches 2 run scoreboard players operation #cc_shul_cap overlimit.const = #cc_shul2 overlimit.const
execute if score #cc_phase overlimit.const matches 3 run scoreboard players operation #cc_shul_cap overlimit.const = #cc_shul3 overlimit.const
execute if score #cc_phase overlimit.const matches 2.. if score #cc_shul_n overlimit.const < #cc_shul_cap overlimit.const store result score #cc_shul_roll overlimit.const run random value 0..99
execute if score #cc_phase overlimit.const matches 2.. if score #cc_shul_n overlimit.const < #cc_shul_cap overlimit.const if score #cc_shul_roll overlimit.const matches 0..12 positioned ~ ~1 ~ run function overlimit:city_clamp/summon_shulker
execute store result score #cc_kind overlimit.const run random value 0..99
execute if score #cc_phase overlimit.const matches 1 if score #cc_kind overlimit.const matches 0..49 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_endermite
execute if score #cc_phase overlimit.const matches 1 if score #cc_kind overlimit.const matches 50..79 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_stray
execute if score #cc_phase overlimit.const matches 1 if score #cc_kind overlimit.const matches 80..99 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_phantom
execute if score #cc_phase overlimit.const matches 2 if score #cc_kind overlimit.const matches 0..29 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_endermite
execute if score #cc_phase overlimit.const matches 2 if score #cc_kind overlimit.const matches 30..54 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_stray
execute if score #cc_phase overlimit.const matches 2 if score #cc_kind overlimit.const matches 55..79 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_phantom
execute if score #cc_phase overlimit.const matches 2 if score #cc_kind overlimit.const matches 80..99 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_breeze
execute if score #cc_phase overlimit.const matches 3 if score #cc_kind overlimit.const matches 0..19 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_endermite
execute if score #cc_phase overlimit.const matches 3 if score #cc_kind overlimit.const matches 20..39 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_stray
execute if score #cc_phase overlimit.const matches 3 if score #cc_kind overlimit.const matches 40..59 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_phantom
execute if score #cc_phase overlimit.const matches 3 if score #cc_kind overlimit.const matches 60..99 positioned ~ ~1 ~ run return run function overlimit:city_clamp/summon_breeze
return fail
