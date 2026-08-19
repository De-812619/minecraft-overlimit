# 地面の上が海・水際なら成功＝濡れている。3×3 に水があれば岸も弾く。
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if biome ~ ~ ~ #minecraft:is_ocean run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~1 ~1 ~ if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~-1 ~1 ~ if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~1 if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~-1 if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~1 ~1 ~1 if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~1 ~1 ~-1 if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~-1 ~1 ~1 if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~-1 ~1 ~-1 if function overlimit:portal/wet_at run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~2 ~ if function overlimit:portal/wet_at run return 1
return fail
