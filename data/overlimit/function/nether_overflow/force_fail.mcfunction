execute unless score #no_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ネザーオーバーフローは発生していない","color":"red"}
tellraw @s {"text":"[overlimit] ネザーオーバーフローを失敗終了した（ネザー化）","color":"gold"}
function overlimit:nether_overflow/end_fail
