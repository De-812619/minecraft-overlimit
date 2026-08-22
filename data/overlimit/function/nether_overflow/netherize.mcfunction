scoreboard players set #no_gfail overlimit.const 0
data modify storage overlimit:no neth.x set from storage overlimit:no gate.x
data modify storage overlimit:no neth.y set from storage overlimit:no gate.y
data modify storage overlimit:no neth.z set from storage overlimit:no gate.z
execute store result score #no_gx overlimit.const run data get storage overlimit:no gate.x
execute store result score #no_gz overlimit.const run data get storage overlimit:no gate.z
function overlimit:nether_overflow/netherize_read_gfail with storage overlimit:no neth
scoreboard players operation #no_rad overlimit.const = #no_r0 overlimit.const
scoreboard players operation #no_add overlimit.const = #no_gfail overlimit.const
scoreboard players operation #no_add overlimit.const *= #no_rstep overlimit.const
scoreboard players operation #no_rad overlimit.const += #no_add overlimit.const
execute store result storage overlimit:no neth.r int 1 run scoreboard players get #no_rad overlimit.const
scoreboard players operation #no_nrad overlimit.const = #no_rad overlimit.const
scoreboard players operation #no_nrad overlimit.const *= #-1 overlimit.const
execute store result storage overlimit:no neth.nr int 1 run scoreboard players get #no_nrad overlimit.const
scoreboard players operation #no_nz overlimit.const = #no_nrad overlimit.const
scoreboard players set #no_nethering overlimit.const 1
function overlimit:nether_overflow/netherize_area_on with storage overlimit:no neth
function overlimit:nether_overflow/netherize_bump_gfail with storage overlimit:no neth
execute as @a[predicate=overlimit:in_overworld] at @s run playsound minecraft:block.portal.trigger ambient @s ~ ~ ~ 0.8 0.5
