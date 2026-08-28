scoreboard players set #nr_arrived overlimit.const 1
scoreboard players set #nr_combat overlimit.const 1
scoreboard players set #nr_t overlimit.const 0
scoreboard players set #nr_phase_t overlimit.const 0
scoreboard players set #nr_spawn_t overlimit.const 0
# 戦場Yを到着プレイヤーの高さに合わせる（開始時のプレイヤーYのままだと要塞床とずれる）
function overlimit:nether_raise/snap_venue_y with storage overlimit:nr target
function overlimit:nether_raise/assign_core
tellraw @a[predicate=overlimit:in_nether] {"text":"戦闘開始。装備の消耗が増している。","color":"gray"}
execute as @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] at @s run function overlimit:nether_raise/spawn_burst
function overlimit:nether_raise/bossbar_name
function overlimit:nether_raise/bossbar_value
