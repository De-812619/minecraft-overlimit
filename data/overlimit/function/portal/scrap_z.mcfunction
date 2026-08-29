# 濡れた門を枠ごと消す（Z向き）。
fill ~-2 ~-4 ~-3 ~2 ~32 ~4 minecraft:air replace minecraft:crying_obsidian
execute positioned ~-2 ~-4 ~-3 run kill @e[type=minecraft:block_display,tag=overlimit.bw_vis,dx=5,dy=38,dz=8]
execute positioned ~-2 ~-4 ~-3 run kill @e[type=minecraft:marker,tag=overlimit.bw_portal,dx=5,dy=38,dz=8]
