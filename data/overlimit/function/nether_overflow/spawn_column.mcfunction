# 高さマップ位置は固体の中 → 1マス上。すでに空気ならその場（足元が固体のときだけ）。
execute unless loaded ~ ~ ~ run return fail
execute unless block ~ ~ ~ #minecraft:replaceable positioned ~ ~1 ~ run return run function overlimit:nether_overflow/spawn_feet
execute if block ~ ~-1 ~ #minecraft:replaceable run return fail
return run function overlimit:nether_overflow/spawn_feet
