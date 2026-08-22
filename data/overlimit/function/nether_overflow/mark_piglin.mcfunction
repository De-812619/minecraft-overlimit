tag @s remove overlimit.no_new
data merge entity @s {IsImmuneToZombification:1b,TimeInOverworld:0,CanPickUpLoot:0b}
execute if entity @s[type=minecraft:piglin] run item replace entity @s weapon.mainhand with minecraft:golden_sword
execute if entity @s[type=minecraft:piglin_brute] run item replace entity @s weapon.mainhand with minecraft:golden_axe
execute if score #no_phase overlimit.const matches 1 run function overlimit:mob/make_warning
execute if score #no_phase overlimit.const matches 2 run function overlimit:mob/make_danger
execute if score #no_phase overlimit.const matches 3 run function overlimit:mob/make_crisis
data merge entity @s {drop_chances:{head:0.0f,mainhand:0.0f}}
attribute @s minecraft:follow_range modifier add overlimit:no_follow 24 add_value
tag @s add overlimit.scanned
function overlimit:nether_overflow/anger
function overlimit:nether_overflow/glow
execute if entity @a[tag=overlimit.no_core,limit=1] run damage @s 1 minecraft:player_attack by @a[tag=overlimit.no_core,limit=1]
