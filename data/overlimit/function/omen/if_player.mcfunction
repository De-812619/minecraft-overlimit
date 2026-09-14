# @s = プレイヤー。瓶由来の不吉（Bad / Raid / Trial Omen）があれば成功。
execute if data entity @s active_effects[{id:"minecraft:bad_omen"}] run return 1
execute if data entity @s active_effects[{id:"minecraft:raid_omen"}] run return 1
execute if data entity @s active_effects[{id:"minecraft:trial_omen"}] run return 1
return fail
