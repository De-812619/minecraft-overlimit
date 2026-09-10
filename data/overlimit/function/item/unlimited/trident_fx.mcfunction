# UNLIMITED トライデント: 投擲中はバニラ見た目なので、金の軌跡で識別する。
particle minecraft:wax_on ~ ~ ~ 0.12 0.12 0.12 0.4 3 force
particle minecraft:dust{color:[1.0,0.78,0.18],scale:0.9} ~ ~ ~ 0.1 0.1 0.1 0 4 force
execute unless data entity @s {inGround:1b} run particle minecraft:falling_dust{block_state:"minecraft:gold_block"} ~ ~ ~ 0.06 0.06 0.06 0 1 force
