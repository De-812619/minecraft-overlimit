# #minecraft:tick と schedule の二重呼び出しを、同じ gametime では一度だけ通す
execute store result score #tick_now overlimit.const run time query gametime
execute if score #tick_now overlimit.const = #tick_at overlimit.const run return fail
scoreboard players operation #tick_at overlimit.const = #tick_now overlimit.const
# 本体より先に次ティックを予約（連鎖切れで schedule が届かないのを防ぐ）
schedule function overlimit:tick_loop 1t replace
scoreboard players set #bm_light_n overlimit.const 0

tag @a remove overlimit.in_bw
execute as @a at @s if dimension overlimit:blood_world run tag @s add overlimit.in_bw
function overlimit:portal/tick

# 読み込み範囲全体を強化すると CustomName で自然デスポーンせず、間引きと湧きが回転する。戦闘圏だけスキャンする。
execute as @a[gamemode=!spectator] at @s as @e[type=#overlimit:can_be_danger,tag=!overlimit.scanned,distance=..25,limit=8] at @s run function overlimit:mob/scan
# 強化の間引き、経験値マーカー、束縛、召喚、ゴーレム、矢、トライデント、麻痺は HotTick（毎tickの広域 @e を避ける）
execute in minecraft:overworld run function overlimit:blood_moon/tick
execute in minecraft:overworld run function overlimit:nether_overflow/tick
execute in minecraft:the_nether run function overlimit:nether_raise/tick
execute in minecraft:the_end run function overlimit:city_clamp/tick
execute if entity @a[tag=overlimit.in_bw] in overlimit:blood_world run function overlimit:blood_world/tick
execute unless entity @a[tag=overlimit.in_bw] if score #bw_active overlimit.const matches 1 in overlimit:blood_world run function overlimit:blood_world/end_empty
execute unless entity @a[tag=overlimit.in_bw] if score #bw_clock overlimit.const matches 1 run function overlimit:blood_world/clock_pause

team join overlimit @a[team=!overlimit]

execute as @a[scores={overlimit.cd.absolute=1..}] run scoreboard players remove @s overlimit.cd.absolute 1
execute as @a[scores={overlimit.cd.ul_royal=1..}] run scoreboard players remove @s overlimit.cd.ul_royal 1
execute as @a[scores={overlimit.cd.ul_demon=1..}] run scoreboard players remove @s overlimit.cd.ul_demon 1
# Impact CD 表示（本人のみ・10秒）: 残煙。足元 + メインハンド（斧）付近（2tickに1回）
execute as @a[scores={overlimit.cd.impact=1..}] at @s run function overlimit:enchant/impact/cd_fx
execute as @a[scores={overlimit.cd.impact=1}] at @s run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1
execute as @a[scores={overlimit.cd.impact=1..}] run scoreboard players remove @s overlimit.cd.impact 1
# Hyper gravity CD 表示（本人のみ・6秒）: portal。足元 + メインハンド付近（2tickに1回）
execute as @a[scores={overlimit.cd.hyper=1..}] at @s run function overlimit:enchant/hyper_gravity/cd_fx
execute as @a[scores={overlimit.cd.hyper=1}] at @s run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1
execute as @a[scores={overlimit.cd.hyper=1..}] run scoreboard players remove @s overlimit.cd.hyper 1
# スカイウォーク・猫足は Java で管理（SkyWalk.java / CatFoot.java）
execute as @a[scores={overlimit.necro_pending=1..}] run scoreboard players remove @s overlimit.necro_pending 1
execute as @a[scores={overlimit.necro_cd=1..}] run scoreboard players remove @s overlimit.necro_cd 1
execute as @a[scores={overlimit.necro_pending=1..}] run function overlimit:enchant/necromancy/check_kill_score
execute as @a[scores={overlimit.necro_pending=1..}] run scoreboard players operation @s overlimit.mob_prev = @s overlimit.mob_kills

# ハイパーディグは PlayerBlockBreakEvents.AFTER（HyperDig.java）で即時発火
# アストラルフロー CD 管理
execute as @a[scores={overlimit.astral.draincd=1..}] run scoreboard players remove @s overlimit.astral.draincd 1
execute as @a[scores={overlimit.astral.hunger_t=1}] run effect clear @s minecraft:hunger
execute as @a[scores={overlimit.astral.hunger_t=1..}] run scoreboard players remove @s overlimit.astral.hunger_t 1

# UNLIMITED 武器: 剣の斬撃。矢・トライデント・斬撃マーカー・麻痺は HotTick
execute as @a[scores={overlimit.ul.sw_cd=1..}] run scoreboard players remove @s overlimit.ul.sw_cd 1
execute as @a[scores={overlimit.ul.ax_cd=1..}] run scoreboard players remove @s overlimit.ul.ax_cd 1
execute as @a[scores={overlimit.ul.sp_cd=1..}] run scoreboard players remove @s overlimit.ul.sp_cd 1
execute as @a[scores={overlimit.ul.used=1..}] at @s run function overlimit:item/unlimited/sword_used
execute as @a[scores={overlimit.ul.axe_used=1..}] at @s run function overlimit:item/unlimited/axe_used

# 金床結果がカーソル→インベントリへ移る1tick遅れ用
execute as @a[scores={overlimit.anvil_cap=1..}] run function overlimit:enchant/anvil_cap/apply
execute as @a[scores={overlimit.anvil_cap=1..}] run scoreboard players remove @s overlimit.anvil_cap 1
