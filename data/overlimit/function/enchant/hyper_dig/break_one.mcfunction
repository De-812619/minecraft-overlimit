# Break one block at current position (quest:aoe/try_break 相当)
execute if block ~ ~ ~ #minecraft:replaceable run return fail
execute if block ~ ~ ~ #overlimit:hyper_dig_immune run return fail
# メインハンドの幸運・シルクタッチを適用してドロップ生成してからブロック除去
loot spawn ~ ~ ~ mine ~ ~ ~ mainhand
setblock ~ ~ ~ minecraft:air
