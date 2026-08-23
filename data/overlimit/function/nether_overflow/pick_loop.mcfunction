execute unless data storage overlimit:no pick[0] run return fail
data modify storage overlimit:no cand set from storage overlimit:no pick[0]
function overlimit:nether_overflow/consider_stored with storage overlimit:no cand
data remove storage overlimit:no pick[0]
function overlimit:nether_overflow/pick_loop
