function overlimit:enchant/hyper_dig/break_cube
scoreboard players set #hd_broke overlimit.const 1
playsound minecraft:block.stone.break player @a ~ ~ ~ 1 0.65
particle minecraft:crit ~ ~ ~ 0.9 0.9 0.9 0.05 36
