execute unless loaded ~ ~ ~ run return fail
execute if score #nr_spawned overlimit.const >= #nr_budget overlimit.const run return fail
# 足元が固体、足元マスと頭上が立てる空気。溶岩・ポータルは不可。
execute if block ~ ~-1 ~ #minecraft:replaceable run return fail
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
execute if block ~ ~ ~ minecraft:lava run return fail
execute if block ~ ~1 ~ minecraft:lava run return fail
execute if block ~ ~-1 ~ minecraft:lava run return fail
execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail
# 最寄プレイヤーから水平24超なら出さない
scoreboard players set #nr_near_lim overlimit.const 24
execute unless function overlimit:nether_raise/near_ok run return fail
execute store result score #nr_kind overlimit.const run random value 0..99
execute if score #nr_kind overlimit.const matches 0..39 run return run function overlimit:nether_raise/summon_piglin
execute if score #nr_kind overlimit.const matches 40..54 run return run function overlimit:nether_raise/summon_brute
execute if score #nr_kind overlimit.const matches 55..79 run return run function overlimit:nether_raise/summon_wither
execute if score #nr_kind overlimit.const matches 80..99 run return run function overlimit:nether_raise/summon_blaze
return fail
