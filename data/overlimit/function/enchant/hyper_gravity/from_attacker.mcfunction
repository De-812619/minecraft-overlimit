# @s = attacker. Position is still the victim (execute on does not change pos).
# 1 field per player: replace only this caster's marker, never another player's.
execute unless entity @s[type=minecraft:player] run return fail
execute if score @s overlimit.cd.hyper matches 1.. run return fail
scoreboard players set @s overlimit.cd.hyper 120

function overlimit:enchant/hyper_gravity/assign_owner_id
tag @s add overlimit.hg_caster
execute as @e[type=minecraft:marker,tag=overlimit.hg_field] if score @s overlimit.hg_owner = @a[tag=overlimit.hg_caster,limit=1] overlimit.hg_owner run kill @s
execute as @e[type=minecraft:marker,tag=overlimit.hg_field] unless score @s overlimit.hg_owner matches 1.. run kill @s
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.hg_field","overlimit.hg_new"]}
execute as @e[type=minecraft:marker,tag=overlimit.hg_new,limit=1,sort=nearest,distance=..2] run function overlimit:enchant/hyper_gravity/init_field
tag @s remove overlimit.hg_caster

particle minecraft:portal ~ ~1 ~ 0.6 0.6 0.6 0.4 40
particle minecraft:reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.6 20
playsound minecraft:block.respawn_anchor.deplete player @a ~ ~ ~ 0.7 0.6
