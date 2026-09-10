# @s = UNLIMITED トライデント。忠誠で引き剥がされるのを着弾点へ戻す。
scoreboard players operation #id overlimit.const = @s overlimit.ul.sid
execute as @e[type=minecraft:marker,tag=overlimit.ul.tri_pin] if score @s overlimit.ul.sid = #id overlimit.const run tag @s add overlimit.ul.pin_now
execute unless entity @e[type=minecraft:marker,tag=overlimit.ul.pin_now,limit=1] run return fail
tp @s @n[type=minecraft:marker,tag=overlimit.ul.pin_now]
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
data modify entity @s NoPhysics set value 0b
data modify entity @s DealtDamage set value 0b
data modify entity @s inGround set value 1b
data modify entity @s inGroundTime set value 0
tag @e[type=minecraft:marker,tag=overlimit.ul.pin_now] remove overlimit.ul.pin_now
