# Phase 0 — scoreboards / team
scoreboard objectives add overlimit.xp_wait dummy
scoreboard objectives add overlimit.cd.absolute dummy
scoreboard objectives add overlimit.cd.impact dummy
scoreboard objectives add overlimit.cd.hyper dummy
scoreboard objectives add overlimit.cd.sky dummy
scoreboard objectives add overlimit.bind.timer dummy
scoreboard objectives add overlimit.summon.life dummy
scoreboard objectives add overlimit.hg_life dummy
scoreboard objectives add overlimit.necro_owner dummy
scoreboard objectives add overlimit.necro_type dummy
scoreboard objectives add overlimit.necro_pending dummy
scoreboard objectives add overlimit.necro_cd dummy
scoreboard objectives add overlimit.mob_kills minecraft.custom:minecraft.mob_kills
scoreboard objectives add overlimit.mob_prev dummy
scoreboard objectives add overlimit.sky_air dummy
scoreboard objectives add overlimit.sky_jmp dummy
scoreboard objectives add overlimit.sky_plat_life dummy
scoreboard objectives add overlimit.sky_lev dummy
scoreboard objectives add overlimit.sky_foot_delay dummy
scoreboard objectives add overlimit.sky_safe dummy
scoreboard objectives add overlimit.sky_land dummy
scoreboard objectives add overlimit.const dummy
scoreboard players set #10 overlimit.const 10
scoreboard players set #2 overlimit.const 2
scoreboard players set #60 overlimit.const 60
scoreboard players set #100 overlimit.const 100
execute unless score #necro_id_seq overlimit.const matches 1.. run scoreboard players set #necro_id_seq overlimit.const 0

# Hyper dig look buffer (parent_quest_pack AoE と同型)
scoreboard objectives add overlimit.hd_x dummy
scoreboard objectives add overlimit.hd_y dummy
scoreboard objectives add overlimit.hd_z dummy
scoreboard objectives add overlimit.hd_ok dummy
scoreboard objectives add overlimit.hd_ore dummy
scoreboard objectives add overlimit.hd_px dummy
scoreboard objectives add overlimit.hd_py dummy
scoreboard objectives add overlimit.hd_pz dummy
scoreboard objectives add overlimit.hd_pok dummy
scoreboard objectives add overlimit.hd_pore dummy
scoreboard objectives add overlimit.hd_prev_life dummy

team add overlimit
team modify overlimit friendlyFire false
team modify overlimit seeFriendlyInvisibles true
team modify overlimit collisionRule pushOwnTeam

advancement revoke @a only overlimit:enchant/on_kill
advancement revoke @a only overlimit:enchant/hyper_dig_mine

# Fabric: schedule ループ（#minecraft:tick 非依存）
schedule function overlimit:tick_loop 1t replace
