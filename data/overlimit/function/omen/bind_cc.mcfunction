function overlimit:omen/capture_end
scoreboard players operation #cc_omen overlimit.const = #omen_found overlimit.const
execute unless score #cc_omen overlimit.const matches 1 run return fail
execute as @a[predicate=overlimit:in_the_end] run function overlimit:omen/consume
tellraw @a[predicate=overlimit:in_the_end] {"translate": "overlimit.msg.omen.cc","color":"dark_purple"}
