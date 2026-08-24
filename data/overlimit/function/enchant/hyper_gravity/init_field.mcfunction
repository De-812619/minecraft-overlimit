# @s = new hg_field marker (tag overlimit.hg_new). Caster is tagged overlimit.hg_caster.
tag @s remove overlimit.hg_new
scoreboard players set @s overlimit.hg_life 60
scoreboard players operation @s overlimit.hg_owner = @a[tag=overlimit.hg_caster,limit=1] overlimit.hg_owner
