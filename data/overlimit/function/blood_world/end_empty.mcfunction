execute unless score #bw_active overlimit.const matches 1 run return fail
function overlimit:stats/lose {holder:"#stat_bw_loss"}
function overlimit:blood_world/end
