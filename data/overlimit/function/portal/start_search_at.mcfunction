$execute in overlimit:blood_world positioned $(x) 200 $(z) run forceload add ~-16 ~-16 ~16 ~16
$execute in overlimit:blood_world positioned $(x) 200 $(z) if loaded ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {Tags:["overlimit.bw_search"],Invisible:1b,NoGravity:1b,Small:1b,Silent:1b,Invulnerable:1b,NoBasePlate:1b}
