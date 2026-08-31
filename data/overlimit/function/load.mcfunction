# Phase 0 — scoreboards / team
scoreboard objectives add overlimit.xp_wait dummy
scoreboard objectives add overlimit.cd.absolute dummy
scoreboard objectives add overlimit.cd.impact dummy
scoreboard objectives add overlimit.cd.hyper dummy
scoreboard objectives add overlimit.cd.sky dummy
scoreboard objectives add overlimit.bind.timer dummy
scoreboard objectives add overlimit.summon.life dummy
scoreboard objectives add overlimit.hg_life dummy
scoreboard objectives add overlimit.hg_owner dummy
scoreboard objectives add overlimit.necro_owner dummy
scoreboard objectives add overlimit.necro_type dummy
scoreboard objectives add overlimit.necro_pending dummy
scoreboard objectives add overlimit.necro_cd dummy
scoreboard objectives add overlimit.mob_kills minecraft.custom:minecraft.mob_kills
scoreboard objectives add overlimit.mob_prev dummy
scoreboard objectives add overlimit.sky_air dummy
scoreboard objectives add overlimit.sky_jmp dummy
scoreboard objectives add overlimit.sky_plat_life dummy
scoreboard objectives add overlimit.sky_lev dummy
scoreboard objectives add overlimit.sky_foot_delay dummy
scoreboard objectives add overlimit.sky_safe dummy
scoreboard objectives add overlimit.sky_land dummy
scoreboard objectives add overlimit.cat_jump dummy
scoreboard objectives add overlimit.cat_mute dummy
scoreboard objectives add overlimit.cat_boost dummy
scoreboard objectives add overlimit.creeper_r dummy
scoreboard objectives add overlimit.const dummy
execute in minecraft:overworld run function overlimit:blood_moon/read_time
function overlimit:portal/capture_spawn
scoreboard players set #10 overlimit.const 10
scoreboard players set #2 overlimit.const 2
scoreboard players set #3 overlimit.const 3
scoreboard players set #5 overlimit.const 5
scoreboard players set #8 overlimit.const 8
scoreboard players set #bw_scale overlimit.const 8
scoreboard players set #17 overlimit.const 17
scoreboard players set #31 overlimit.const 31
scoreboard players set #20 overlimit.const 20
scoreboard players set #40 overlimit.const 40
scoreboard players set #80 overlimit.const 80
scoreboard players set #60 overlimit.const 60
scoreboard players set #100 overlimit.const 100
scoreboard players set #23460 overlimit.const 23460
scoreboard players set #11460 overlimit.const 11460
scoreboard players set #24000 overlimit.const 24000
scoreboard players set #bm_chance_base overlimit.const 30
scoreboard players set #bm_chance_step overlimit.const 20
scoreboard players set #bm_chance_cap overlimit.const 100
execute unless score #necro_id_seq overlimit.const matches 1.. run scoreboard players set #necro_id_seq overlimit.const 0
execute unless score #hg_id_seq overlimit.const matches 1.. run scoreboard players set #hg_id_seq overlimit.const 0
execute unless score #bm_active overlimit.const matches 0.. run scoreboard players set #bm_active overlimit.const 0
execute unless score #bm_kills overlimit.const matches 0.. run scoreboard players set #bm_kills overlimit.const 0
execute unless score #bm_checked overlimit.const matches 0.. run scoreboard players set #bm_checked overlimit.const 0
execute unless score #bm_chance overlimit.const matches 0.. run scoreboard players operation #bm_chance overlimit.const = #bm_chance_base overlimit.const
scoreboard players set #bm_spawn_int overlimit.const 80
scoreboard players set #bm_spawn_cap overlimit.const 24
scoreboard players set #bm_spawn_near overlimit.const 16
scoreboard players set #bm_spawn_min_y overlimit.const 60
scoreboard players set #bm_spawn_burst overlimit.const 10
execute unless score #bm_spawn_t overlimit.const matches 0.. run scoreboard players set #bm_spawn_t overlimit.const 0
scoreboard players set #6 overlimit.const 6
scoreboard players set #-1 overlimit.const -1
scoreboard players set #no_interval overlimit.const 6
scoreboard players set #no_time_max overlimit.const 36000
scoreboard players set #no_phase_max overlimit.const 12000
scoreboard players set #no_budget1 overlimit.const 100
scoreboard players set #no_budget2 overlimit.const 70
scoreboard players set #no_budget3 overlimit.const 30
scoreboard players set #no_ghast_max overlimit.const 1
scoreboard players set #no_ghast_budget overlimit.const 5
scoreboard players set #no_cap overlimit.const 12
scoreboard players set #no_r0 overlimit.const 8
scoreboard players set #no_rstep overlimit.const 4
scoreboard players set #no_follow overlimit.const 24
scoreboard players set #no_int1 overlimit.const 20
scoreboard players set #no_int2 overlimit.const 25
scoreboard players set #no_int3 overlimit.const 40
scoreboard players set #no_burst overlimit.const 8
scoreboard players set #no_scan_r overlimit.const 32
scoreboard players set #no_scan_y overlimit.const 16
execute unless score #heat overlimit.const matches 0..5 run scoreboard players set #heat overlimit.const 0
function overlimit:heat/refresh
execute unless score #pressure overlimit.const matches 0..20 run scoreboard players set #pressure overlimit.const 0
scoreboard players operation #pressure_day overlimit.const = #bm_daynow overlimit.const
execute unless score #pressure_won_day overlimit.const matches 0.. run scoreboard players operation #pressure_won_day overlimit.const = #bm_daynow overlimit.const
function overlimit:pressure/refresh
execute unless score #no_active overlimit.const matches 0.. run scoreboard players set #no_active overlimit.const 0
execute unless score #no_paused overlimit.const matches 0.. run scoreboard players set #no_paused overlimit.const 0
execute unless score #no_dusk overlimit.const matches 0.. run scoreboard players set #no_dusk overlimit.const 0
execute unless score #no_dusk_checked overlimit.const matches 0.. run scoreboard players set #no_dusk_checked overlimit.const 0
execute unless score #no_fail overlimit.const matches 0.. run scoreboard players set #no_fail overlimit.const 0
execute unless score #no_nethering overlimit.const matches 0.. run scoreboard players set #no_nethering overlimit.const 0
execute if score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/netherize_area_on with storage overlimit:no neth
execute unless score #no_t overlimit.const matches 0.. run scoreboard players set #no_t overlimit.const 0
execute unless score #no_phase overlimit.const matches 1.. run scoreboard players set #no_phase overlimit.const 1
execute unless score #no_ghast_n overlimit.const matches 0.. run scoreboard players set #no_ghast_n overlimit.const 0
execute unless score #no_ghast_cd overlimit.const matches -1.. run scoreboard players set #no_ghast_cd overlimit.const 0
scoreboard objectives add overlimit.no_deaths deathCount
scoreboard objectives add overlimit.no_gfail dummy
scoreboard players set @a overlimit.no_deaths 0
execute unless data storage overlimit:no gate run data modify storage overlimit:no gate set value {x:0,y:64,z:0}
execute unless data storage overlimit:no gates run data modify storage overlimit:no gates set value []
execute unless score #no_arrived overlimit.const matches 0.. run scoreboard players set #no_arrived overlimit.const 0
execute unless score #no_pc_prev overlimit.const matches 0.. run scoreboard players set #no_pc_prev overlimit.const 0
execute unless score #bw_active overlimit.const matches 0.. run scoreboard players set #bw_active overlimit.const 0
execute unless score #bw_kills overlimit.const matches 0.. run scoreboard players set #bw_kills overlimit.const 0
execute unless score #bw_spawn_t overlimit.const matches 0.. run scoreboard players set #bw_spawn_t overlimit.const 0
execute unless score #tick_at overlimit.const matches -1.. run scoreboard players set #tick_at overlimit.const -1
execute unless score #bw_ended_day overlimit.const matches -1.. run scoreboard players set #bw_ended_day overlimit.const -1
execute unless score #bw_clock overlimit.const matches 0.. run scoreboard players set #bw_clock overlimit.const 0
time of overlimit:blood_world pause
scoreboard players set #bw_clock overlimit.const 0
scoreboard players set #portal_charge_need overlimit.const 80
scoreboard objectives add overlimit.anvil_cap dummy
scoreboard objectives add overlimit.portal_cd dummy
scoreboard objectives add overlimit.portal_wait dummy
scoreboard objectives add overlimit.portal_charge dummy
scoreboard objectives add overlimit.owx dummy
scoreboard objectives add overlimit.owy dummy
scoreboard objectives add overlimit.owz dummy
scoreboard objectives add overlimit.ow_has dummy
scoreboard objectives add overlimit.bwx dummy
scoreboard objectives add overlimit.bwy dummy
scoreboard objectives add overlimit.bwz dummy
scoreboard objectives add overlimit.bw_has dummy
tag @a remove overlimit.portal_arrive
tag @a remove overlimit.to_bw
tag @a remove overlimit.to_ow
execute as @a run function overlimit:portal/release
scoreboard players set @a overlimit.portal_cd 0
scoreboard players set @a overlimit.portal_charge 0
kill @e[type=minecraft:armor_stand,tag=overlimit.bw_search]


# Hyper dig look buffer (parent_quest_pack AoE と同型)
scoreboard objectives add overlimit.hd_x dummy
scoreboard objectives add overlimit.hd_y dummy
scoreboard objectives add overlimit.hd_z dummy
scoreboard objectives add overlimit.hd_ok dummy
scoreboard objectives add overlimit.hd_ore dummy
scoreboard objectives add overlimit.hd_px dummy
scoreboard objectives add overlimit.hd_py dummy
scoreboard objectives add overlimit.hd_pz dummy
scoreboard objectives add overlimit.hd_pok dummy
scoreboard objectives add overlimit.hd_pore dummy
scoreboard objectives add overlimit.hd_prev_life dummy

team add overlimit
team modify overlimit friendlyFire false
team modify overlimit seeFriendlyInvisibles true
team modify overlimit collisionRule pushOwnTeam
team add overlimit_warn
team modify overlimit_warn color gold
team add overlimit_dang
team modify overlimit_dang color red
team add overlimit_cris
team modify overlimit_cris color dark_purple
team add overlimit_disa
team modify overlimit_disa color blue

advancement revoke @a only overlimit:enchant/on_kill
advancement revoke @a only overlimit:enchant/hyper_dig_mine
advancement revoke @a only overlimit:enchant/midas_table_eat
advancement revoke @a only overlimit:enchant/anvil_cap
advancement revoke @a only overlimit:blood_moon/on_kill
advancement revoke @a only overlimit:portal/light
advancement revoke @a only overlimit:attrition/on_hurt

bossbar add overlimit:blood_moon {"text":"ブラッドムーン","color":"dark_red","bold":true}
bossbar set overlimit:blood_moon color red
execute store result bossbar overlimit:blood_moon max run scoreboard players get #11460 overlimit.const
bossbar set overlimit:blood_moon style progress
execute if score #bm_active overlimit.const matches 1 run function overlimit:blood_moon/restore
execute unless score #bm_active overlimit.const matches 1 run bossbar set overlimit:blood_moon players
execute unless score #bm_active overlimit.const matches 1 run function overlimit:blood_moon/fog_off

bossbar add overlimit:blood_world {"text":"ブラッドムーン","color":"dark_red","bold":true}
bossbar set overlimit:blood_world color red
execute store result bossbar overlimit:blood_world max run scoreboard players get #11460 overlimit.const
bossbar set overlimit:blood_world style progress
execute if score #bw_active overlimit.const matches 1 run function overlimit:blood_world/restore
execute unless score #bw_active overlimit.const matches 1 run bossbar set overlimit:blood_world players
execute unless score #bw_active overlimit.const matches 1 run function overlimit:blood_world/fog_off
execute as @a at @s if dimension overlimit:blood_world run weather clear 1000000

bossbar add overlimit:nether_overflow {"text":"ネザーオーバーフロー","color":"dark_purple","bold":true}
bossbar set overlimit:nether_overflow color purple
execute store result bossbar overlimit:nether_overflow max run scoreboard players get #no_time_max overlimit.const
bossbar set overlimit:nether_overflow style progress
execute if score #no_active overlimit.const matches 1 run function overlimit:nether_overflow/restore
execute unless score #no_active overlimit.const matches 1 run bossbar set overlimit:nether_overflow players

scoreboard objectives add overlimit.nr_deaths deathCount
scoreboard objectives add overlimit.cc_deaths deathCount
execute unless score #nr_active overlimit.const matches 0.. run scoreboard players set #nr_active overlimit.const 0
execute unless score #nr_combat overlimit.const matches 0.. run scoreboard players set #nr_combat overlimit.const 0
execute unless score #nr_paused overlimit.const matches 0.. run scoreboard players set #nr_paused overlimit.const 0
execute unless score #nr_dwell overlimit.const matches 0.. run scoreboard players set #nr_dwell overlimit.const 0
execute unless score #nr_arrived overlimit.const matches 0.. run scoreboard players set #nr_arrived overlimit.const 0
execute unless score #nr_t overlimit.const matches 0.. run scoreboard players set #nr_t overlimit.const 0
execute unless score #nr_phase overlimit.const matches 1.. run scoreboard players set #nr_phase overlimit.const 1
execute unless score #nr_phase_t overlimit.const matches 0.. run scoreboard players set #nr_phase_t overlimit.const 0
execute unless score #nr_spawn_t overlimit.const matches 0.. run scoreboard players set #nr_spawn_t overlimit.const 0
execute unless score #nr_spawned overlimit.const matches 0.. run scoreboard players set #nr_spawned overlimit.const 0
execute unless score #nr_ghast_n overlimit.const matches 0.. run scoreboard players set #nr_ghast_n overlimit.const 0
execute unless score #nr_ghast_cd overlimit.const matches -1.. run scoreboard players set #nr_ghast_cd overlimit.const 0
execute unless score #nr_fail_boost overlimit.const matches 0.. run scoreboard players set #nr_fail_boost overlimit.const 0
scoreboard players set #nr_dwell_max overlimit.const 36000
scoreboard players set #nr_time_max overlimit.const 18000
scoreboard players set #nr_phase_max overlimit.const 6000
scoreboard players set #nr_cap overlimit.const 10
scoreboard players set #nr_ghast_max overlimit.const 1
scoreboard players set #nr_ghast_budget overlimit.const 3
scoreboard players set #nr_search overlimit.const 1200
scoreboard players set #nr_int1 overlimit.const 20
scoreboard players set #nr_int2 overlimit.const 25
scoreboard players set #nr_int3 overlimit.const 40
scoreboard players set #999999 overlimit.const 999999
execute unless data storage overlimit:nr cleared run data modify storage overlimit:nr cleared set value []
execute unless score #nr_gather_t overlimit.const matches 0.. run scoreboard players set #nr_gather_t overlimit.const 0
execute unless data storage overlimit:nr target run data modify storage overlimit:nr target set value {x:0,y:64,z:0,kind:"minecraft:fortress"}

execute unless score #cc_active overlimit.const matches 0.. run scoreboard players set #cc_active overlimit.const 0
execute unless score #cc_combat overlimit.const matches 0.. run scoreboard players set #cc_combat overlimit.const 0
execute unless score #cc_paused overlimit.const matches 0.. run scoreboard players set #cc_paused overlimit.const 0
execute unless score #cc_dwell overlimit.const matches 0.. run scoreboard players set #cc_dwell overlimit.const 0
execute unless score #cc_arrived overlimit.const matches 0.. run scoreboard players set #cc_arrived overlimit.const 0
execute unless score #cc_t overlimit.const matches 0.. run scoreboard players set #cc_t overlimit.const 0
execute unless score #cc_phase overlimit.const matches 1.. run scoreboard players set #cc_phase overlimit.const 1
execute unless score #cc_phase_t overlimit.const matches 0.. run scoreboard players set #cc_phase_t overlimit.const 0
execute unless score #cc_spawn_t overlimit.const matches 0.. run scoreboard players set #cc_spawn_t overlimit.const 0
execute unless score #cc_spawned overlimit.const matches 0.. run scoreboard players set #cc_spawned overlimit.const 0
execute unless score #cc_shul_n overlimit.const matches 0.. run scoreboard players set #cc_shul_n overlimit.const 0
execute unless score #cc_boss overlimit.const matches 0.. run scoreboard players set #cc_boss overlimit.const 0
execute unless score #cc_gather_t overlimit.const matches 0.. run scoreboard players set #cc_gather_t overlimit.const 0
execute unless score #no_boost_active overlimit.const matches 0.. run scoreboard players set #no_boost_active overlimit.const 0
scoreboard players set #cc_dwell_max overlimit.const 24000
scoreboard players set #cc_time_max overlimit.const 14400
scoreboard players set #cc_phase_max overlimit.const 4800
scoreboard players set #cc_cap overlimit.const 8
scoreboard players set #cc_search overlimit.const 1200
scoreboard players set #cc_int1 overlimit.const 20
scoreboard players set #cc_int2 overlimit.const 25
scoreboard players set #cc_int3 overlimit.const 40
execute unless data storage overlimit:cc cleared run data modify storage overlimit:cc cleared set value []
execute unless data storage overlimit:cc target run data modify storage overlimit:cc target set value {x:0,y:64,z:0,kind:"minecraft:end_city"}

bossbar add overlimit:nether_raise {"text":"ネザーレイズ","color":"gold","bold":true}
bossbar set overlimit:nether_raise color yellow
execute store result bossbar overlimit:nether_raise max run scoreboard players get #nr_time_max overlimit.const
bossbar set overlimit:nether_raise style progress
execute if score #nr_active overlimit.const matches 1 run function overlimit:nether_raise/restore
execute unless score #nr_active overlimit.const matches 1 run bossbar set overlimit:nether_raise players

bossbar add overlimit:city_clamp {"text":"シティクランプ","color":"blue","bold":true}
bossbar set overlimit:city_clamp color blue
execute store result bossbar overlimit:city_clamp max run scoreboard players get #cc_time_max overlimit.const
bossbar set overlimit:city_clamp style progress
execute if score #cc_active overlimit.const matches 1 run function overlimit:city_clamp/restore
execute unless score #cc_active overlimit.const matches 1 run bossbar set overlimit:city_clamp players

execute as @a run attribute @s minecraft:jump_strength modifier remove overlimit:enchantment.cat_foot.jump
execute as @a run attribute @s minecraft:jump_strength modifier remove overlimit:sky_walk_no_cat
execute as @a run attribute @s minecraft:jump_strength modifier remove overlimit:cat_foot_jump
execute as @a run attribute @s minecraft:jump_strength modifier remove overlimit:cat_foot_air_mute
execute as @a run effect clear @s minecraft:jump_boost
scoreboard players set @a overlimit.cat_jump 0
scoreboard players set @a overlimit.cat_mute 0
scoreboard players set @a overlimit.cat_boost 0

# Old cat_foot decoys (string farm). Safe to run every reload.
execute as @e[type=minecraft:cat,tag=overlimit.cat_decoy] run function overlimit:enchant/cat_foot/discard_decoy

# 旧トーテム基盤の護符／静寂トーテムを新しいベースアイテムへ
execute as @a run function overlimit:item/migrate_legacy_totem

# Fabric: schedule ループ（#minecraft:tick 非依存）
schedule function overlimit:tick_loop 1t replace
