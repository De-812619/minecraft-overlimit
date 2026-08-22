scoreboard players operation #no_cx overlimit.const = #no_nx overlimit.const
scoreboard players add #no_cx overlimit.const 512
scoreboard players operation #no_cx overlimit.const /= #8 overlimit.const
scoreboard players operation #no_cz overlimit.const = #no_nz overlimit.const
scoreboard players add #no_cz overlimit.const 512
scoreboard players operation #no_cz overlimit.const /= #8 overlimit.const
scoreboard players operation #no_h overlimit.const = #no_cx overlimit.const
scoreboard players operation #no_h overlimit.const *= #31 overlimit.const
scoreboard players operation #no_t2 overlimit.const = #no_cz overlimit.const
scoreboard players operation #no_t2 overlimit.const *= #17 overlimit.const
scoreboard players operation #no_h overlimit.const += #no_t2 overlimit.const
scoreboard players operation #no_h overlimit.const += #no_gx overlimit.const
scoreboard players operation #no_h overlimit.const += #no_gz overlimit.const
scoreboard players operation #no_biome overlimit.const = #no_h overlimit.const
scoreboard players operation #no_biome overlimit.const %= #5 overlimit.const
execute if score #no_biome overlimit.const matches ..-1 run scoreboard players add #no_biome overlimit.const 5
