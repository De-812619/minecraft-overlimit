# X 向き枠（x=-1..2）＋左右1マス。各列は自分の高さマップで水際を見る。
execute if function overlimit:portal/is_wet_line run return 1
execute positioned ~1 ~ ~ if function overlimit:portal/is_wet_line run return 1
execute positioned ~-1 ~ ~ if function overlimit:portal/is_wet_line run return 1
execute positioned ~2 ~ ~ if function overlimit:portal/is_wet_line run return 1
execute positioned ~-2 ~ ~ if function overlimit:portal/is_wet_line run return 1
execute positioned ~3 ~ ~ if function overlimit:portal/is_wet_line run return 1
return fail
