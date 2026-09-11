scoreboard players set #omen_found overlimit.const 0
execute as @a[predicate=overlimit:in_the_end,gamemode=!spectator] if function overlimit:omen/if_player run scoreboard players set #omen_found overlimit.const 1
