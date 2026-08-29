# OW 門 (x,z) → BW (x*8, z*8)。Y は着地後に合わせる。境界はワールドボーダー内に丸める。
scoreboard players operation @s overlimit.bwx = @s overlimit.owx
scoreboard players operation @s overlimit.bwz = @s overlimit.owz
scoreboard players operation @s overlimit.bwx *= #bw_scale overlimit.const
scoreboard players operation @s overlimit.bwz *= #bw_scale overlimit.const
scoreboard players set @s overlimit.bwy 64
scoreboard players set @s overlimit.bw_has 1
execute if score @s overlimit.bwx matches 30000000.. run scoreboard players set @s overlimit.bwx 29999984
execute if score @s overlimit.bwx matches ..-30000000 run scoreboard players set @s overlimit.bwx -29999984
execute if score @s overlimit.bwz matches 30000000.. run scoreboard players set @s overlimit.bwz 29999984
execute if score @s overlimit.bwz matches ..-30000000 run scoreboard players set @s overlimit.bwz -29999984
