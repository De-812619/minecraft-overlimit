execute if predicate overlimit:in_blood_world run return run title @s actionbar {"translate": "overlimit.msg.portal.to_ow","color":"light_purple"}
execute if entity @s[tag=overlimit.portal_arrive] run return run title @s actionbar {"translate": "overlimit.msg.portal.busy","color":"light_purple"}
title @s actionbar {"translate": "overlimit.msg.portal.to_bw","color":"light_purple"}
