# このマスが水面・水草なら成功（濡れている）。
execute if block ~ ~ ~ minecraft:water run return 1
execute if block ~ ~ ~ minecraft:lava run return 1
execute if block ~ ~ ~ minecraft:bubble_column run return 1
execute if block ~ ~ ~ minecraft:kelp run return 1
execute if block ~ ~ ~ minecraft:kelp_plant run return 1
execute if block ~ ~ ~ minecraft:seagrass run return 1
execute if block ~ ~ ~ minecraft:tall_seagrass run return 1
execute if block ~ ~ ~ #minecraft:underwater_bonemeals run return 1
execute if block ~ ~ ~ minecraft:ice run return 1
execute if block ~ ~ ~ minecraft:frosted_ice run return 1
execute if block ~ ~ ~ minecraft:packed_ice run return 1
return fail
