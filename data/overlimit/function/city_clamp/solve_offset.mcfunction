execute if score #cc_dxp overlimit.const matches ..0 run return fail
execute if score #cc_dxm overlimit.const matches ..0 run return fail
execute if score #cc_dzp overlimit.const matches ..0 run return fail
execute if score #cc_dzm overlimit.const matches ..0 run return fail
scoreboard players operation #cc_dxp overlimit.const *= #cc_dxp overlimit.const
scoreboard players operation #cc_dxm overlimit.const *= #cc_dxm overlimit.const
scoreboard players operation #cc_ox overlimit.const = #cc_dxm overlimit.const
scoreboard players operation #cc_ox overlimit.const -= #cc_dxp overlimit.const
scoreboard players operation #cc_ox overlimit.const /= #cc_div overlimit.const
scoreboard players operation #cc_dzp overlimit.const *= #cc_dzp overlimit.const
scoreboard players operation #cc_dzm overlimit.const *= #cc_dzm overlimit.const
scoreboard players operation #cc_oz overlimit.const = #cc_dzm overlimit.const
scoreboard players operation #cc_oz overlimit.const -= #cc_dzp overlimit.const
scoreboard players operation #cc_oz overlimit.const /= #cc_div overlimit.const
return 1
