# ゲージは朝までの残りtick（12000→23460 を満タンとする）
scoreboard players operation #bm_left overlimit.const = #23460 overlimit.const
scoreboard players operation #bm_left overlimit.const -= #bm_tod overlimit.const
execute if score #bm_left overlimit.const matches ..-1 run scoreboard players set #bm_left overlimit.const 0
execute if score #bm_left overlimit.const > #11460 overlimit.const run scoreboard players operation #bm_left overlimit.const = #11460 overlimit.const
execute store result bossbar overlimit:blood_moon value run scoreboard players get #bm_left overlimit.const
