# pending のブロックがすでに空気なら、そこを中心に 3×3×3
$execute positioned $(x) $(y) $(z) if block ~ ~ ~ #minecraft:replaceable run function overlimit:enchant/hyper_dig/activate
