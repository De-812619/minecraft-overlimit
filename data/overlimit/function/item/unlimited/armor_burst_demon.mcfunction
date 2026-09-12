# 禍々しいオーラ：魂炎と闇の噴き出し。
function overlimit:item/unlimited/armor_burst
particle minecraft:flash{color:[0.42,0.05,0.08,1.0]} ~ ~1 ~ 0 0 0 0 1 force
particle minecraft:soul ~ ~1.1 ~ 2.2 0.45 2.2 0.03 36 force
particle minecraft:soul_fire_flame ~ ~0.9 ~ 1.8 0.25 1.8 0.02 28 force
particle minecraft:dust{color:[0.35,0.02,0.08],scale:1.5} ~ ~1 ~ 2.3 0.35 2.3 0.01 40 force
particle minecraft:reverse_portal ~ ~1.2 ~ 1.6 0.5 1.6 0.55 24 force
particle minecraft:crimson_spore ~ ~1 ~ 1.5 0.6 1.5 0.0 30 force
particle minecraft:smoke ~ ~0.8 ~ 1.4 0.2 1.4 0.04 18 force
playsound minecraft:particle.soul_escape player @a ~ ~ ~ 1.4 0.6
playsound minecraft:entity.warden.heartbeat player @a ~ ~ ~ 0.7 0.75
playsound minecraft:entity.wither.shoot player @a ~ ~ ~ 0.35 0.55
