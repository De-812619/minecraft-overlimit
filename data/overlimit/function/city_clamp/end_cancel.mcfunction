execute unless score #cc_active overlimit.const matches 1 run return fail
tellraw @a[predicate=overlimit:in_the_end] {"translate": "overlimit.msg.cc.cancel","color":"gray"}
function overlimit:city_clamp/end
