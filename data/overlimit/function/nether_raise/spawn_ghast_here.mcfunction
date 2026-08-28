execute if entity @e[tag=overlimit.nr_ghast,limit=1] run return fail
execute if block ~ ~ ~ minecraft:nether_portal run return fail
# 高さマップは天井に吸われるので、戦場Yから上に空きを探す
execute positioned ~ ~8 ~ if function overlimit:nether_raise/maybe_ghast run return 1
execute positioned ~ ~12 ~ if function overlimit:nether_raise/maybe_ghast run return 1
execute positioned ~ ~5 ~ if function overlimit:nether_raise/maybe_ghast run return 1
execute positioned ~ ~16 ~ if function overlimit:nether_raise/maybe_ghast run return 1
return fail
