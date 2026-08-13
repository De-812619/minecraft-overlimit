# Runs at hit location. Owner is @p with tag overlimit.summoning (or nearest summoning player).
summon minecraft:wolf ~ ~ ~ {Tags:["overlimit.summon","overlimit.summon_wolf","overlimit.summon_new"],PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:40.0d},{id:"minecraft:attack_damage",base:8.0d},{id:"minecraft:armor",base:4.0d}],Health:40.0f}
execute as @e[type=minecraft:wolf,tag=overlimit.summon_new,limit=1,sort=nearest] run function overlimit:enchant/summon_wolf/init_wolf
playsound minecraft:entity.wolf.howl neutral @a ~ ~ ~ 0.7 1.1
particle minecraft:cloud ~ ~0.5 ~ 0.4 0.3 0.4 0.02 12
