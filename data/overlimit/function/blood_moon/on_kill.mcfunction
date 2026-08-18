advancement revoke @s only overlimit:blood_moon/on_kill
execute unless score #bm_active overlimit.const matches 1 run return fail
execute at @s as @e[type=minecraft:marker,tag=overlimit.bm_xp,tag=!overlimit.bm_credited,distance=..32] run function overlimit:blood_moon/credit_from_xp
