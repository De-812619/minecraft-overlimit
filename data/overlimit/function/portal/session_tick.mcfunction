execute if entity @a[tag=overlimit.in_bw] run return run function overlimit:portal/session_occupied
execute if entity @a[tag=overlimit.portal_arrive] run return fail
function overlimit:portal/session_empty
