execute if score #bw_dxp overlimit.const matches ..0 run return fail
execute if score #bw_dxm overlimit.const matches ..0 run return fail
execute if score #bw_dzp overlimit.const matches ..0 run return fail
execute if score #bw_dzm overlimit.const matches ..0 run return fail
scoreboard players operation #bw_dxp overlimit.const *= #bw_dxp overlimit.const
scoreboard players operation #bw_dxm overlimit.const *= #bw_dxm overlimit.const
scoreboard players operation #bw_sox overlimit.const = #bw_dxm overlimit.const
scoreboard players operation #bw_sox overlimit.const -= #bw_dxp overlimit.const
scoreboard players operation #bw_sox overlimit.const /= #bw_sdiv overlimit.const
scoreboard players operation #bw_dzp overlimit.const *= #bw_dzp overlimit.const
scoreboard players operation #bw_dzm overlimit.const *= #bw_dzm overlimit.const
scoreboard players operation #bw_soz overlimit.const = #bw_dzm overlimit.const
scoreboard players operation #bw_soz overlimit.const -= #bw_dzp overlimit.const
scoreboard players operation #bw_soz overlimit.const /= #bw_sdiv overlimit.const
return 1
