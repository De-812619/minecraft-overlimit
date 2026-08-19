execute unless score #bw_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ブラッドワールドのブラッドムーンは発生していない","color":"red"}
tellraw @s {"text":"[overlimit] ブラッドワールドのブラッドムーンを強制終了した","color":"gold"}
execute in overlimit:blood_world run function overlimit:blood_world/end
