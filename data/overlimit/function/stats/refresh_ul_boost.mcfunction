# BM は 100 勝ごと、他イベントは 50 勝ごと。UNLIMITED スロットを 25% にする
scoreboard players set #ul_boost overlimit.const 0
scoreboard players set #ul_mod overlimit.const 0
execute if score #reward_event overlimit.const matches 1 run scoreboard players operation #ul_mod overlimit.const = #stat_bm_wins overlimit.const
execute if score #reward_event overlimit.const matches 2 run scoreboard players operation #ul_mod overlimit.const = #stat_bw_wins overlimit.const
execute if score #reward_event overlimit.const matches 3 run scoreboard players operation #ul_mod overlimit.const = #stat_no_wins overlimit.const
execute if score #reward_event overlimit.const matches 4 run scoreboard players operation #ul_mod overlimit.const = #stat_nr_wins overlimit.const
execute if score #reward_event overlimit.const matches 5 run scoreboard players operation #ul_mod overlimit.const = #stat_cc_wins overlimit.const
execute if score #ul_mod overlimit.const matches 0 run return fail
scoreboard players operation #ul_step overlimit.const = #50 overlimit.const
execute if score #reward_event overlimit.const matches 1 run scoreboard players operation #ul_step overlimit.const = #100 overlimit.const
scoreboard players operation #ul_mod overlimit.const %= #ul_step overlimit.const
execute if score #ul_mod overlimit.const matches 0 run scoreboard players set #ul_boost overlimit.const 1
return 1
