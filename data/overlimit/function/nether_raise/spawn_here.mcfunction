# ネザーの高さマップは天井岩盤に吸われるので使わない。
# 会場マーカーYを基準に ±6 で「足元が固体・胴体が空気」の床を探す。
execute if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~1 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~-1 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~2 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~-2 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~3 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~-3 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~4 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~-4 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~5 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~-5 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~6 ~ if function overlimit:nether_raise/spawn_column run return 1
execute positioned ~ ~-6 ~ if function overlimit:nether_raise/spawn_column run return 1
return fail
