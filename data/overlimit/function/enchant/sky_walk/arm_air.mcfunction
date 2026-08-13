# First airborne tick: mark air and consume takeoff hold (jump or sneak).
scoreboard players set @s overlimit.sky_air 1
scoreboard players set #jmp overlimit.const 0
execute if predicate overlimit:enchant/jump_input run scoreboard players set #jmp overlimit.const 1
execute if predicate overlimit:is_sneaking run scoreboard players set #jmp overlimit.const 1
execute if score #jmp overlimit.const matches 1 run scoreboard players set @s overlimit.sky_jmp 1
