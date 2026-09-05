# #minecraft:tick と schedule の二重呼び出しを、同じ gametime では一度だけ通す
execute store result score #tick_now overlimit.const run time query gametime
execute if score #tick_now overlimit.const = #tick_at overlimit.const run return fail
scoreboard players operation #tick_at overlimit.const = #tick_now overlimit.const

tag @a remove overlimit.in_bw
execute as @a at @s if dimension overlimit:blood_world run tag @s add overlimit.in_bw
function overlimit:portal/tick

execute as @e[type=#overlimit:can_be_danger,tag=!overlimit.scanned,limit=8] at @s run function overlimit:mob/scan
execute as @e[type=minecraft:marker,tag=overlimit.elite_xp] at @s run function overlimit:mob/xp_marker_tick
execute as @e[type=minecraft:marker,tag=overlimit.danger_xp,tag=!overlimit.elite_xp] at @s run function overlimit:mob/xp_marker_tick
execute in minecraft:overworld run function overlimit:blood_moon/tick
execute in minecraft:overworld run function overlimit:nether_overflow/tick
execute in minecraft:the_nether run function overlimit:nether_raise/tick
execute in minecraft:the_end run function overlimit:city_clamp/tick
execute if entity @a[tag=overlimit.in_bw] in overlimit:blood_world run function overlimit:blood_world/tick
execute unless entity @a[tag=overlimit.in_bw] if score #bw_active overlimit.const matches 1 in overlimit:blood_world run function overlimit:blood_world/end_empty
execute unless entity @a[tag=overlimit.in_bw] if score #bw_clock overlimit.const matches 1 run function overlimit:blood_world/clock_pause

team join overlimit @a[team=!overlimit]

execute as @a[scores={overlimit.cd.absolute=1..}] run scoreboard players remove @s overlimit.cd.absolute 1
# Impact CD 表示（本人のみ・10秒）: 残煙。足元 + メインハンド（斧）付近（2tickに1回）
execute as @a[scores={overlimit.cd.impact=1..}] at @s run function overlimit:enchant/impact/cd_fx
execute as @a[scores={overlimit.cd.impact=1}] at @s run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1
execute as @a[scores={overlimit.cd.impact=1..}] run scoreboard players remove @s overlimit.cd.impact 1
# Hyper gravity CD 表示（本人のみ・6秒）: portal。足元 + メインハンド付近（2tickに1回）
execute as @a[scores={overlimit.cd.hyper=1..}] at @s run function overlimit:enchant/hyper_gravity/cd_fx
execute as @a[scores={overlimit.cd.hyper=1}] at @s run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1
execute as @a[scores={overlimit.cd.hyper=1..}] run scoreboard players remove @s overlimit.cd.hyper 1
execute as @a[scores={overlimit.cd.sky=1..}] run scoreboard players remove @s overlimit.cd.sky 1
execute as @a[scores={overlimit.sky_air=1}] unless data entity @s equipment.feet.components."minecraft:enchantments"."overlimit:sky_walk" run function overlimit:enchant/sky_walk/disarm
execute as @a[scores={overlimit.cat_boost=1}] unless data entity @s equipment.feet.components."minecraft:enchantments"."overlimit:cat_foot" run function overlimit:enchant/cat_foot/clear_jump
execute as @a[scores={overlimit.sky_lev=1..}] run function overlimit:enchant/sky_walk/lev_tick
execute as @a[scores={overlimit.sky_safe=1}] run function overlimit:enchant/sky_walk/safe_tick
execute as @a[scores={overlimit.sky_foot_delay=1}] at @s unless predicate overlimit:enchant/jump_input unless predicate overlimit:is_sneaking run function overlimit:enchant/sky_walk/place_footing
execute as @a[scores={overlimit.sky_foot_delay=1}] at @s unless predicate overlimit:enchant/jump_input unless predicate overlimit:is_sneaking run scoreboard players set @s overlimit.sky_foot_delay 0
execute as @a[scores={overlimit.sky_foot_delay=2..}] run scoreboard players remove @s overlimit.sky_foot_delay 1
execute as @a[scores={overlimit.necro_pending=1..}] run scoreboard players remove @s overlimit.necro_pending 1
execute as @a[scores={overlimit.necro_cd=1..}] run scoreboard players remove @s overlimit.necro_cd 1
execute as @a[scores={overlimit.necro_pending=1..}] run function overlimit:enchant/necromancy/check_kill_score
execute as @a[scores={overlimit.necro_pending=1..}] run scoreboard players operation @s overlimit.mob_prev = @s overlimit.mob_kills
execute as @e[type=#overlimit:can_be_danger,scores={overlimit.bind.timer=1..}] run function overlimit:enchant/chain_bind/tick_bound
execute as @e[type=#overlimit:summon,tag=overlimit.summon,scores={overlimit.summon.life=1..}] at @s run function overlimit:enchant/summon_wolf/life_tick
execute as @e[type=minecraft:iron_golem,tag=overlimit.mini_golem,tag=!overlimit.mini_golem_ready] at @s run function overlimit:item/mini_golem/init

# Hyper gravity field
execute as @e[type=minecraft:marker,tag=overlimit.hg_field] at @s run function overlimit:enchant/hyper_gravity/field_tick

# Necromancy combat nudge
execute as @e[type=#overlimit:can_be_danger,tag=overlimit.necro] at @s run function overlimit:enchant/necromancy/aggro_tick

# Sky walk footing platforms
execute as @e[type=minecraft:marker,tag=overlimit.sky_plat] at @s run function overlimit:enchant/sky_walk/plat_tick

# Sky walk: air footing は boots の minecraft:tick（装備者だけ）

# Cat foot: leftover decoy cats (old impl) + restore creeper blast when the wearer is gone
execute as @e[type=minecraft:cat,tag=overlimit.cat_decoy] run function overlimit:enchant/cat_foot/discard_decoy
execute as @e[type=minecraft:creeper,tag=overlimit.cat_pacify] at @s run function overlimit:enchant/cat_foot/pacify_tick

# Hyper dig: pending が空気になったら 3×3（耐久力不発の保険）。at @s でプレイヤーのディメンションを見る
execute as @a[scores={overlimit.hd_ok=1}] at @s run function overlimit:enchant/hyper_dig/tick_player
execute as @a[scores={overlimit.hd_ok=0,overlimit.hd_pok=1}] at @s run function overlimit:enchant/hyper_dig/tick_player

# 黄金弓: 撃った矢の速度2倍＋光の矢相当の発光
execute as @e[type=#minecraft:arrows,tag=!overlimit.gb_done] run function overlimit:item/golden_bow/try_shot

# 金床結果がカーソル→インベントリへ移る1tick遅れ用
execute as @a[scores={overlimit.anvil_cap=1..}] run function overlimit:enchant/anvil_cap/apply
execute as @a[scores={overlimit.anvil_cap=1..}] run scoreboard players remove @s overlimit.anvil_cap 1

# Fabric: schedule が死んでいたら毎tick張り直す
schedule function overlimit:tick_loop 1t replace
