advancement revoke @s only overlimit:item/quiet_totem
execute if score #bm_active overlimit.const matches 1 run return run function overlimit:item/quiet_totem/suppress_bm
execute if score #no_active overlimit.const matches 1 run return run function overlimit:item/quiet_totem/suppress_no
execute if score #no_nethering overlimit.const matches 1 run return run function overlimit:item/quiet_totem/suppress_no
execute if score #nr_active overlimit.const matches 1 if predicate overlimit:in_nether run return run function overlimit:item/quiet_totem/suppress_nr
execute if score #cc_active overlimit.const matches 1 if predicate overlimit:in_the_end run return run function overlimit:item/quiet_totem/suppress_cc
execute if score #nr_active overlimit.const matches 1 run return run function overlimit:item/quiet_totem/on_fail
execute if score #cc_active overlimit.const matches 1 run return run function overlimit:item/quiet_totem/on_fail
function overlimit:item/quiet_totem/on_fail
