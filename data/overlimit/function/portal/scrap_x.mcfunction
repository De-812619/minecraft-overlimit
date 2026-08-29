# 濡れた門を枠ごと消す（黒曜石を残すと次の設置が高さマップでその上に積まれる）。
fill ~-3 ~-4 ~-2 ~4 ~32 ~2 minecraft:air replace minecraft:crying_obsidian
execute positioned ~-3 ~-4 ~-2 run kill @e[type=minecraft:block_display,tag=overlimit.bw_vis,dx=8,dy=38,dz=5]
execute positioned ~-3 ~-4 ~-2 run kill @e[type=minecraft:marker,tag=overlimit.bw_portal,dx=8,dy=38,dz=5]
