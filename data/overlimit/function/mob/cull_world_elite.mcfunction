# イベント外の名前付き強化。CustomName のため自然デスポーンしないので、バニラ相当で消す。
# 32マス以内に生存者がいれば戦闘中とみなす。128超は即、32〜128は約30秒。
execute if entity @a[gamemode=!spectator,distance=..32] run scoreboard players set @s overlimit.elite_idle 0
execute if entity @a[gamemode=!spectator,distance=..32] run return fail
execute unless entity @a[gamemode=!spectator,distance=..128] run return run function overlimit:blood_moon/despawn_one
scoreboard players add @s overlimit.elite_idle 1
execute if score @s overlimit.elite_idle matches 600.. run return run function overlimit:blood_moon/despawn_one
return fail
