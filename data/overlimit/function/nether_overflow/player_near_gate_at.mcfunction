$execute in minecraft:overworld positioned $(x) $(y) $(z) if entity @a[predicate=overlimit:in_overworld,gamemode=!spectator,distance=..$(r)] run return 1
return fail
