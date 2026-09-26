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

# 戦闘圏 25 マス・プレイヤーあたり 8 体の強化スキャンは PlayerPulse
# 強化の間引き、経験値マーカー、召喚、ゴーレム、矢、トライデント、麻痺は HotTick。束縛と重力場の速度は Java
execute in minecraft:overworld run function overlimit:blood_moon/tick
execute in minecraft:overworld run function overlimit:nether_overflow/tick
execute in minecraft:the_nether run function overlimit:nether_raise/tick
execute in minecraft:the_end run function overlimit:city_clamp/tick
execute if entity @a[tag=overlimit.in_bw] in overlimit:blood_world run function overlimit:blood_world/tick
execute unless entity @a[tag=overlimit.in_bw] if score #bw_active overlimit.const matches 1 in overlimit:blood_world run function overlimit:blood_world/end_empty
execute unless entity @a[tag=overlimit.in_bw] if score #bw_clock overlimit.const matches 1 run function overlimit:blood_world/clock_pause

team join overlimit @a[team=!overlimit]

# クールダウン・ネクロマンシー待ち・UNLIMITED 使用・金床上限は PlayerPulse
# スカイウォーク・猫足・千里眼は Java（SkyWalk / CatFoot / Clairvoyance）
# ハイパーディグは PlayerBlockBreakEvents.AFTER（HyperDig.java）
