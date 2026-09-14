execute if entity @s[tag=overlimit.trim.set.iron] run function overlimit:attrition/apply_iron
execute unless entity @s[tag=overlimit.trim.set.iron] run function overlimit:attrition/apply_normal
function overlimit:attrition/mute
