# テキストは撃破数。ゲージ更新は tick_active 側。
execute if score #bm_kills overlimit.const = #bm_kills_shown overlimit.const run return fail
scoreboard players operation #bm_kills_shown overlimit.const = #bm_kills overlimit.const
bossbar set overlimit:blood_moon name [{"text":"ブラッドムーン  ","color":"dark_red","bold":true},{"score":{"name":"#bm_kills","objective":"overlimit.const"},"color":"red"},{"text":"/","color":"red"},{"score":{"name":"#100","objective":"overlimit.const"},"color":"red"},{"text":"体","color":"red"}]
