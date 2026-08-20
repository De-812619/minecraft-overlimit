# Leftover decoy from the old passenger implementation. No string drops.
data modify entity @s DeathLootTable set value "minecraft:empty"
execute at @s run tp @s ~ -256 ~
kill @s
