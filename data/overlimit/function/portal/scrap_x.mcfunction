# 濡れた門を枠ごと消す（黒曜石を残すと次の設置が高さマップでその上に積まれる）。
fill ~-1 ~-1 ~ ~2 ~24 ~ minecraft:air replace minecraft:crying_obsidian
execute positioned ~-1 ~-1 ~ run kill @e[type=minecraft:block_display,tag=overlimit.bw_vis,dx=3,dy=26,dz=1]
execute positioned ~-1 ~-1 ~ run kill @e[type=minecraft:marker,tag=overlimit.bw_portal,dx=3,dy=26,dz=1]
