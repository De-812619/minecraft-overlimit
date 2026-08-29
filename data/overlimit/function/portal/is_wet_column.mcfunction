# この列の地表（高さマップ）かその上が水・溶岩・海／浜／川なら成功＝濡れている。
execute positioned over motion_blocking_no_leaves if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if biome ~ ~ ~ #minecraft:is_ocean run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if biome ~ ~ ~ #minecraft:is_beach run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if biome ~ ~ ~ overlimit:beach run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if biome ~ ~ ~ overlimit:snowy_beach run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if biome ~ ~ ~ #minecraft:is_river run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if biome ~ ~ ~ minecraft:stony_shore run return 1
return fail
