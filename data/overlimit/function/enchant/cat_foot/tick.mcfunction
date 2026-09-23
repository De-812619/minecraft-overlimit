# @s = wearer. Nearby creepers lose aggro and never finish a fuse.
execute at @s run function overlimit:enchant/cat_foot/strip_old_jump
execute at @s run function overlimit:enchant/cat_foot/sync_jump
execute at @s run function overlimit:enchant/cat_foot/strip_old_jump
# クリーパー走査は 4tick に 1 回（ヒューズ開始は 3 マス・数ティックの猶予がある）
execute store result score #cf overlimit.const run time query gametime
scoreboard players operation #cf overlimit.const %= #4 overlimit.const
execute if score #cf overlimit.const matches 0 at @s as @e[type=minecraft:creeper,tag=!overlimit.summon,distance=..16] run function overlimit:enchant/cat_foot/pacify
