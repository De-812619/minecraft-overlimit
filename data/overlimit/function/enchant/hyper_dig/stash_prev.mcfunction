# 次ブロックの hit_block で上書きする直前の座標を短時間残す（耐久不発＋押しっぱなし用）
scoreboard players operation @s overlimit.hd_px = @s overlimit.hd_x
scoreboard players operation @s overlimit.hd_py = @s overlimit.hd_y
scoreboard players operation @s overlimit.hd_pz = @s overlimit.hd_z
scoreboard players set @s overlimit.hd_pok 1
scoreboard players set @s overlimit.hd_prev_life 2
