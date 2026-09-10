# ピンを外して忠誠に戻す。何度呼ばれても安全。
scoreboard players operation #id overlimit.const = @s overlimit.ul.sid
execute as @e[type=minecraft:marker,tag=overlimit.ul.tri_pin] if score @s overlimit.ul.sid = #id overlimit.const run kill @s
