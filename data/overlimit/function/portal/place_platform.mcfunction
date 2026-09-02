# 水面・溶岩の高さに泣く黒曜石の足場と門。ネザーの着地足場と同じ役割。
execute align xyz run fill ~-2 ~-1 ~-2 ~3 ~-1 ~2 minecraft:crying_obsidian
execute align xyz run fill ~-2 ~ ~-2 ~3 ~3 ~2 minecraft:air
execute align xyz run function overlimit:portal/build_x
return 1
