scoreboard players set @s overlimit.portal_charge 0
function overlimit:portal/release
execute if score #bw_preload overlimit.const matches 1 unless score #bw_pending overlimit.const matches 1 unless entity @a[scores={overlimit.portal_charge=1..}] run function overlimit:portal/preload_cancel
