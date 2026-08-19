# 濡れた門を枠ごと消す（Z向き）。
fill ~ ~-1 ~-1 ~ ~24 ~2 minecraft:air replace minecraft:crying_obsidian
execute positioned ~ ~-1 ~-1 run kill @e[type=minecraft:block_display,tag=overlimit.bw_vis,dx=1,dy=26,dz=3]
execute positioned ~ ~-1 ~-1 run kill @e[type=minecraft:marker,tag=overlimit.bw_portal,dx=1,dy=26,dz=3]
