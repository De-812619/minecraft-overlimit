# @s = 着弾ピン。トライデントが居なければ消す。
scoreboard players operation #id overlimit.const = @s overlimit.ul.sid
execute as @e[type=minecraft:trident,tag=overlimit.ul.tri] if score @s overlimit.ul.sid = #id overlimit.const run return 1
kill @s
