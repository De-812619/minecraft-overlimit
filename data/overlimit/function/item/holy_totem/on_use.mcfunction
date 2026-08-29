advancement revoke @s only overlimit:item/holy_totem
execute if score #pressure overlimit.const matches ..0 run return run function overlimit:item/holy_totem/on_fail
tellraw @a [{"selector":"@s","color":"gold"},{"text":" が聖王のトーテムで世界圧をリセットした。","color":"gray"}]
function overlimit:item/holy_totem/fx
function overlimit:pressure/reset
tag @s add overlimit.ht_pay
schedule function overlimit:item/holy_totem/pay_pulse 1t append
