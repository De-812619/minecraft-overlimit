execute unless data storage overlimit:no chk[0] run return fail
execute store result score #no_ax overlimit.const run data get storage overlimit:no chk[0].x
execute store result score #no_ay overlimit.const run data get storage overlimit:no chk[0].y
execute store result score #no_az overlimit.const run data get storage overlimit:no chk[0].z
execute store result score #no_bx overlimit.const run data get storage overlimit:no cand.x
execute store result score #no_by overlimit.const run data get storage overlimit:no cand.y
execute store result score #no_bz overlimit.const run data get storage overlimit:no cand.z
execute if score #no_ax overlimit.const = #no_bx overlimit.const if score #no_ay overlimit.const = #no_by overlimit.const if score #no_az overlimit.const = #no_bz overlimit.const run return run scoreboard players set #no_dup overlimit.const 1
data remove storage overlimit:no chk[0]
function overlimit:nether_overflow/remember_chk
