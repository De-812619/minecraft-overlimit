execute as @e[type=#overlimit:can_be_danger,tag=!overlimit.scanned] at @s run function overlimit:mob/scan
execute as @e[type=minecraft:marker,tag=overlimit.elite_xp] at @s run function overlimit:mob/xp_marker_tick
execute as @e[type=minecraft:marker,tag=overlimit.danger_xp,tag=!overlimit.elite_xp] at @s run function overlimit:mob/xp_marker_tick
tag @a remove overlimit.in_bw
execute as @a at @s if dimension overlimit:blood_world run tag @s add overlimit.in_bw
function overlimit:portal/tick
function overlimit:portal/session_tick
execute in minecraft:overworld run function overlimit:blood_moon/tick
execute in overlimit:blood_world run function overlimit:blood_world/tick

team join overlimit @a[team=!overlimit]

execute as @a[scores={overlimit.cd.absolute=1..}] run scoreboard players remove @s overlimit.cd.absolute 1
# Impact CD 表示（本人のみ・10秒）: 残煙。足元 + メインハンド（斧）付近（2tickに1回）
execute as @a[scores={overlimit.cd.impact=1..}] at @s run function overlimit:enchant/impact/cd_fx
execute as @a[scores={overlimit.cd.impact=1}] at @s run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1
execute as @a[scores={overlimit.cd.impact=1..}] run scoreboard players remove @s overlimit.cd.impact 1
execute as @a[scores={overlimit.cd.hyper=1..}] run scoreboard players remove @s overlimit.cd.hyper 1
execute as @a[scores={overlimit.cd.sky=1..}] run scoreboard players remove @s overlimit.cd.sky 1
execute as @a[scores={overlimit.sky_lev=1..}] run function overlimit:enchant/sky_walk/lev_tick
execute as @a[scores={overlimit.sky_safe=1}] run function overlimit:enchant/sky_walk/safe_tick
execute as @a[scores={overlimit.sky_foot_delay=1}] at @s run function overlimit:enchant/sky_walk/place_footing
execute as @a[scores={overlimit.sky_foot_delay=1..}] run scoreboard players remove @s overlimit.sky_foot_delay 1
execute as @a[scores={overlimit.necro_pending=1..}] run scoreboard players remove @s overlimit.necro_pending 1
execute as @a[scores={overlimit.necro_cd=1..}] run scoreboard players remove @s overlimit.necro_cd 1
execute as @a run function overlimit:enchant/necromancy/check_kill_score
execute as @a run scoreboard players operation @s overlimit.mob_prev = @s overlimit.mob_kills
execute as @e[scores={overlimit.bind.timer=1..}] run function overlimit:enchant/chain_bind/tick_bound
execute as @e[tag=overlimit.summon,scores={overlimit.summon.life=1..}] at @s run function overlimit:enchant/summon_wolf/life_tick

# Hyper gravity field
execute as @e[type=minecraft:marker,tag=overlimit.hg_field] at @s run function overlimit:enchant/hyper_gravity/field_tick

# Necromancy combat nudge
execute as @e[tag=overlimit.necro] at @s run function overlimit:enchant/necromancy/aggro_tick

# Sky walk footing platforms
execute as @e[type=minecraft:marker,tag=overlimit.sky_plat] at @s run function overlimit:enchant/sky_walk/plat_tick

# Sky walk: air footing trigger
execute as @a at @s run function overlimit:enchant/sky_walk/tick_player

# Cat foot: leftover decoy cats (old impl) + restore creeper blast when the wearer is gone
execute as @e[type=minecraft:cat,tag=overlimit.cat_decoy] run function overlimit:enchant/cat_foot/discard_decoy
execute as @e[type=minecraft:creeper,tag=overlimit.cat_pacify] at @s run function overlimit:enchant/cat_foot/pacify_tick

# Hyper dig: pending が空気になったら 3×3（耐久力不発の保険）
execute as @a run function overlimit:enchant/hyper_dig/tick_player

# 金床結果がカーソル→インベントリへ移る1tick遅れ用
execute as @a[scores={overlimit.anvil_cap=1..}] run function overlimit:enchant/anvil_cap/apply
execute as @a[scores={overlimit.anvil_cap=1..}] run scoreboard players remove @s overlimit.anvil_cap 1

# Fabric: schedule が死んでいたら毎tick張り直す
schedule function overlimit:tick_loop 1t replace
