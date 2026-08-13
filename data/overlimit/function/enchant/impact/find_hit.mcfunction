# Ray along look until a solid block (the struck block).
execute align xyz unless block ~ ~ ~ #minecraft:replaceable run return run function overlimit:enchant/impact/blast_from_block

scoreboard players add #impact_ray overlimit.const 1
execute if score #impact_ray overlimit.const matches 28.. run return fail
execute positioned ^ ^ ^0.25 run return run function overlimit:enchant/impact/find_hit
