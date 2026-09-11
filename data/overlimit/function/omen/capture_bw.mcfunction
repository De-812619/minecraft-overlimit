scoreboard players set #omen_found overlimit.const 0
execute as @a[tag=overlimit.in_bw,gamemode=!spectator] if function overlimit:omen/if_player run scoreboard players set #omen_found overlimit.const 1
