# @s = player
function overlimit:trim/count
function overlimit:trim/sets
function overlimit:trim/apply
execute unless entity @s[tag=overlimit.trim.set.amethyst] if entity @s[tag=overlimit.trim.amy_nv] run function overlimit:trim/amethyst/clear_nv
function overlimit:trim/resin/reset_move
