# 撃破点なし・ドロップなしで消す。原点 (0,-10000,0) へ送らない。
# 旧実装の tp は blood_world の chunk [0,0] に残骸が溜まった（latest.log: oversized 2.2MB）。
execute on passengers if entity @s[tag=overlimit.elite_xp] run kill @s
data merge entity @s {DeathLootTable:"minecraft:empty",Silent:1b,drop_chances:{head:0.0f,chest:0.0f,legs:0.0f,feet:0.0f,mainhand:0.0f,offhand:0.0f}}
data remove entity @s CustomName
data merge entity @s {CustomNameVisible:0b}
kill @s
