# クールダウンと forceload。門の粒子・枠・立ち位置は PortalGate
execute as @a[scores={overlimit.portal_cd=1..}] run scoreboard players remove @s overlimit.portal_cd 1
execute as @a[scores={overlimit.pfl_dim=1..}] run function overlimit:portal/forceload_watch
