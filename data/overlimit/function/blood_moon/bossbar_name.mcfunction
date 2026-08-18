# 撃破点はマクロで数字を埋め込む。score コンポーネントだと 0/100 のまま張り付くことがある。
execute store result storage overlimit:blood_moon kills int 1 run scoreboard players get #bm_kills overlimit.const
function overlimit:blood_moon/bossbar_name_set with storage overlimit:blood_moon
