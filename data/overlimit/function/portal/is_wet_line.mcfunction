# 枠の前後（Z±2）まで、列ごとに濡れていないか。
execute if function overlimit:portal/is_wet_column run return 1
execute positioned ~ ~ ~1 if function overlimit:portal/is_wet_column run return 1
execute positioned ~ ~ ~-1 if function overlimit:portal/is_wet_column run return 1
execute positioned ~ ~ ~2 if function overlimit:portal/is_wet_column run return 1
execute positioned ~ ~ ~-2 if function overlimit:portal/is_wet_column run return 1
return fail
