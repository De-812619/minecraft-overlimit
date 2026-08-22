execute store result score #no_px overlimit.const run data get entity @s Pos[0]
execute store result score #no_pz overlimit.const run data get entity @s Pos[2]
scoreboard players operation #no_dx overlimit.const = #no_px overlimit.const
scoreboard players operation #no_dx overlimit.const -= #no_gx2 overlimit.const
scoreboard players operation #no_dz overlimit.const = #no_pz overlimit.const
scoreboard players operation #no_dz overlimit.const -= #no_gz2 overlimit.const
scoreboard players operation #no_dx overlimit.const *= #no_dx overlimit.const
scoreboard players operation #no_dz overlimit.const *= #no_dz overlimit.const
scoreboard players operation #no_d overlimit.const = #no_dx overlimit.const
scoreboard players operation #no_d overlimit.const += #no_dz overlimit.const
execute if score #no_d overlimit.const < #no_mind overlimit.const run scoreboard players operation #no_mind overlimit.const = #no_d overlimit.const
