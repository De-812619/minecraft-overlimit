scoreboard players set #no_paxis overlimit.const 0
execute if block ~ ~ ~ minecraft:nether_portal[axis=x] run scoreboard players set #no_paxis overlimit.const 1
execute if block ~ ~ ~ minecraft:nether_portal[axis=z] run scoreboard players set #no_paxis overlimit.const 2
execute if score #no_paxis overlimit.const matches 0 if block ~1 ~ ~ minecraft:nether_portal[axis=x] run scoreboard players set #no_paxis overlimit.const 1
execute if score #no_paxis overlimit.const matches 0 if block ~-1 ~ ~ minecraft:nether_portal[axis=x] run scoreboard players set #no_paxis overlimit.const 1
execute if score #no_paxis overlimit.const matches 0 if block ~ ~ ~1 minecraft:nether_portal[axis=x] run scoreboard players set #no_paxis overlimit.const 1
execute if score #no_paxis overlimit.const matches 0 if block ~ ~ ~-1 minecraft:nether_portal[axis=x] run scoreboard players set #no_paxis overlimit.const 1
execute if score #no_paxis overlimit.const matches 0 if block ~ ~1 ~ minecraft:nether_portal[axis=x] run scoreboard players set #no_paxis overlimit.const 1
execute if score #no_paxis overlimit.const matches 0 if block ~ ~-1 ~ minecraft:nether_portal[axis=x] run scoreboard players set #no_paxis overlimit.const 1
execute if score #no_paxis overlimit.const matches 0 if block ~1 ~ ~ minecraft:nether_portal[axis=z] run scoreboard players set #no_paxis overlimit.const 2
execute if score #no_paxis overlimit.const matches 0 if block ~-1 ~ ~ minecraft:nether_portal[axis=z] run scoreboard players set #no_paxis overlimit.const 2
execute if score #no_paxis overlimit.const matches 0 if block ~ ~ ~1 minecraft:nether_portal[axis=z] run scoreboard players set #no_paxis overlimit.const 2
execute if score #no_paxis overlimit.const matches 0 if block ~ ~ ~-1 minecraft:nether_portal[axis=z] run scoreboard players set #no_paxis overlimit.const 2
execute if score #no_paxis overlimit.const matches 0 if block ~ ~1 ~ minecraft:nether_portal[axis=z] run scoreboard players set #no_paxis overlimit.const 2
execute if score #no_paxis overlimit.const matches 0 if block ~ ~-1 ~ minecraft:nether_portal[axis=z] run scoreboard players set #no_paxis overlimit.const 2
execute if score #no_paxis overlimit.const matches 0 run return fail
execute if score #no_paxis overlimit.const matches 1 positioned ~ ~ ~2 if function overlimit:nether_overflow/try_chest_column run return 1
execute if score #no_paxis overlimit.const matches 1 positioned ~ ~ ~-2 if function overlimit:nether_overflow/try_chest_column run return 1
execute if score #no_paxis overlimit.const matches 1 positioned ~ ~ ~3 if function overlimit:nether_overflow/try_chest_column run return 1
execute if score #no_paxis overlimit.const matches 1 positioned ~ ~ ~-3 if function overlimit:nether_overflow/try_chest_column run return 1
execute if score #no_paxis overlimit.const matches 2 positioned ~2 ~ ~ if function overlimit:nether_overflow/try_chest_column run return 1
execute if score #no_paxis overlimit.const matches 2 positioned ~-2 ~ ~ if function overlimit:nether_overflow/try_chest_column run return 1
execute if score #no_paxis overlimit.const matches 2 positioned ~3 ~ ~ if function overlimit:nether_overflow/try_chest_column run return 1
execute if score #no_paxis overlimit.const matches 2 positioned ~-3 ~ ~ if function overlimit:nether_overflow/try_chest_column run return 1
return fail
