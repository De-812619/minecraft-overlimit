execute store result score #hp overlimit.const run data get entity @s Health 10
execute store result score #mx overlimit.const run attribute @s minecraft:max_health get 10
execute store result score #lv overlimit.const run data get entity @s XpLevel
tellraw @s ["",{"text":"[trim] HP ","color":"gold"},{"score":{"name":"#hp","objective":"overlimit.const"}},{"text":"/","color":"dark_gray"},{"score":{"name":"#mx","objective":"overlimit.const"}},{"text":" (×0.1)  Lv ","color":"gray"},{"score":{"name":"#lv","objective":"overlimit.const"}},{"text":"  銅ヒット ","color":"gray"},{"score":{"name":"@s","objective":"overlimit.trim.cu_hits"}},{"text":"  金怒り ","color":"gray"},{"score":{"name":"@s","objective":"overlimit.trim.anger"}},{"text":"  着地CD ","color":"gray"},{"score":{"name":"@s","objective":"overlimit.trim.amy_cd"}}]
tellraw @s ["",{"text":"[trim] 頭 ","color":"gold"},{"nbt":"equipment.head.id","entity":"@s","color":"white"}]
execute if predicate overlimit:trim/on_ground run tellraw @s {"text":"[trim] 接地: はい","color":"gray"}
execute unless predicate overlimit:trim/on_ground run tellraw @s {"text":"[trim] 接地: いいえ","color":"gray"}
