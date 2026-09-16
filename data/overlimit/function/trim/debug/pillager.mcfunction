execute at @s run summon minecraft:pillager ~ ~1 ~ {PersistenceRequired:1b}
tellraw @s {"translate": "overlimit.trim.dbg.pillager","color":"gray"}
function overlimit:trim/debug
