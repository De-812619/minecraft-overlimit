function overlimit:attrition/stopsounds
tag @s add overlimit.attrition_mute
schedule function overlimit:attrition/mute_later 1t append
