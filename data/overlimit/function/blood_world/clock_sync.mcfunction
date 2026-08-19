# 誰か（スペクテイター含む）がいれば進める。誰もいなければ止める（ネザー／エンドのチャンク停止に近い）
execute if entity @a[tag=overlimit.in_bw] run return run function overlimit:blood_world/clock_resume
function overlimit:blood_world/clock_pause
