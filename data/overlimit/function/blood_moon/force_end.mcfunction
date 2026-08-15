execute unless score #bm_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ブラッドムーンは発生していない","color":"red"}
tellraw @s {"text":"[overlimit] ブラッドムーンを強制終了した","color":"gold"}
function overlimit:blood_moon/end
