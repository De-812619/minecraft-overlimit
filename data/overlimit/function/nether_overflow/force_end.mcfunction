execute unless score #no_active overlimit.const matches 1 unless score #no_nethering overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ネザーオーバーフローは発生していない","color":"red"}
tellraw @s {"text":"[overlimit] ネザーオーバーフローを強制終了した（ネザー化なし）","color":"gold"}
execute if score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/netherize_finish
execute if score #no_active overlimit.const matches 1 run function overlimit:nether_overflow/end
