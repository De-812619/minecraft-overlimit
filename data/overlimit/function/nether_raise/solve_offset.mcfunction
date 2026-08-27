execute if score #nr_dxp overlimit.const matches ..0 run return fail
execute if score #nr_dxm overlimit.const matches ..0 run return fail
execute if score #nr_dzp overlimit.const matches ..0 run return fail
execute if score #nr_dzm overlimit.const matches ..0 run return fail
scoreboard players operation #nr_dxp overlimit.const *= #nr_dxp overlimit.const
scoreboard players operation #nr_dxm overlimit.const *= #nr_dxm overlimit.const
scoreboard players operation #nr_ox overlimit.const = #nr_dxm overlimit.const
scoreboard players operation #nr_ox overlimit.const -= #nr_dxp overlimit.const
scoreboard players operation #nr_ox overlimit.const /= #nr_div overlimit.const
scoreboard players operation #nr_dzp overlimit.const *= #nr_dzp overlimit.const
scoreboard players operation #nr_dzm overlimit.const *= #nr_dzm overlimit.const
scoreboard players operation #nr_oz overlimit.const = #nr_dzm overlimit.const
scoreboard players operation #nr_oz overlimit.const -= #nr_dzp overlimit.const
scoreboard players operation #nr_oz overlimit.const /= #nr_div overlimit.const
return 1
