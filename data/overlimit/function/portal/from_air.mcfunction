execute if score #portal_lit overlimit.const matches 1 run return fail
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute positioned ~ ~ ~ run function overlimit:portal/try_x
execute positioned ~-1 ~ ~ run function overlimit:portal/try_x
execute positioned ~ ~-1 ~ run function overlimit:portal/try_x
execute positioned ~-1 ~-1 ~ run function overlimit:portal/try_x
execute positioned ~ ~-2 ~ run function overlimit:portal/try_x
execute positioned ~-1 ~-2 ~ run function overlimit:portal/try_x
execute positioned ~ ~ ~ run function overlimit:portal/try_z
execute positioned ~ ~ ~-1 run function overlimit:portal/try_z
execute positioned ~ ~-1 ~ run function overlimit:portal/try_z
execute positioned ~ ~-1 ~-1 run function overlimit:portal/try_z
execute positioned ~ ~-2 ~ run function overlimit:portal/try_z
execute positioned ~ ~-2 ~-1 run function overlimit:portal/try_z
