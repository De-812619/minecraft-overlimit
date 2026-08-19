# ブラッドワールドのピグリン／ブルートは常に強化。イベント中だけ撃破点対象。
execute store result score #roll overlimit.const run random value 0..99
execute if score #roll overlimit.const matches 0..4 run function overlimit:mob/make_crisis
execute if score #roll overlimit.const matches 5..19 run function overlimit:mob/make_danger
execute if score #roll overlimit.const matches 20..99 run function overlimit:mob/make_warning
execute if score #bw_active overlimit.const matches 1 run function overlimit:blood_moon/mark_elite
tag @s add overlimit.scanned
