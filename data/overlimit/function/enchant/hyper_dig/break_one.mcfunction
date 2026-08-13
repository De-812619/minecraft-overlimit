# Break one block at current position (quest:aoe/try_break 相当)
execute if block ~ ~ ~ #minecraft:replaceable run return fail
execute if block ~ ~ ~ #overlimit:hyper_dig_immune run return fail
setblock ~ ~ ~ minecraft:air destroy
