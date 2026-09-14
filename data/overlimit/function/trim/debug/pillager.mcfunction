execute at @s run summon minecraft:pillager ~ ~1 ~ {PersistenceRequired:1b}
tellraw @s {"text":"[trim] ピリジャーを出した。半径8以内で再表示すると aura を読む","color":"gray"}
function overlimit:trim/debug
