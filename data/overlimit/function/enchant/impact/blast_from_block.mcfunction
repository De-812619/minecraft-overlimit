# At struck block. Spawn KB origin on the block, wave horizontally above it.
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.kb_center","overlimit.impact_marker"]}
tag @s add overlimit.impact_attacker

# Horizontal beam from block top, using player yaw only (pitch forced to 0)
execute align xyz positioned ~0.5 ~1.05 ~0.5 rotated as @s rotated ~ 0 run function overlimit:enchant/impact/horizontal_wave

tag @s remove overlimit.impact_attacker
kill @e[type=minecraft:marker,tag=overlimit.impact_marker]
return 1
