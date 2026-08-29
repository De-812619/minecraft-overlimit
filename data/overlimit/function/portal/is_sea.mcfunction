# 海バイオーム。Y=220 の3Dバイオームではなく、地表の列で判定する。
execute positioned over world_surface if biome ~ ~ ~ #minecraft:is_ocean run return 1
execute if biome ~ ~ ~ #minecraft:is_ocean run return 1
return fail
