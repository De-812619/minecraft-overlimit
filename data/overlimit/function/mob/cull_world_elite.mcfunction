# イベント外の名前付き強化。CustomName のため自然デスポーンしないので、バニラ相当で消す。
# 128マス以内に生存者がいれば戦闘中とみなす。256超は即、128〜256は約30秒。
# 構造物配置（PersistenceRequired）はバニラどおり残す。エリトラ通過でチャンクが先に載っても消さない。
execute if entity @s[tag=overlimit.structure] run return fail
execute if data entity @s {PersistenceRequired:1b} run return fail
execute if entity @a[gamemode=!spectator,distance=..128] run scoreboard players set @s overlimit.elite_idle 0
execute if entity @a[gamemode=!spectator,distance=..128] run return fail
execute unless entity @a[gamemode=!spectator,distance=..256] run return run function overlimit:blood_moon/despawn_one
scoreboard players add @s overlimit.elite_idle 1
execute if score @s overlimit.elite_idle matches 600.. run return run function overlimit:blood_moon/despawn_one
return fail
