# チャンク未ロード、または高さマップがまだ空気。海判定より先に生成待ちへ。
execute unless loaded ~ ~ ~ run return 1
execute positioned over motion_blocking_no_leaves if block ~ ~ ~ minecraft:air run return 1
execute positioned over motion_blocking_no_leaves if block ~ ~ ~ minecraft:cave_air run return 1
return fail
