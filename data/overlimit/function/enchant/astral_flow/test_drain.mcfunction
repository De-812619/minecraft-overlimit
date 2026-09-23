# 手動確認用: /function overlimit:enchant/astral_flow/test_drain
# 音が鳴り満腹が減れば do_drain 自体は正常。

scoreboard players set @s overlimit.astral.on 3
scoreboard players set @s overlimit.astral.draincd 0
function overlimit:enchant/astral_flow/do_drain
tellraw @s {"translate": "overlimit.cmd.astral_drain","color":"light_purple"}
