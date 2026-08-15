title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"text":"ブラッドムーン","color":"dark_red"}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"夜が明けた","color":"gray"}
tellraw @a[predicate=overlimit:in_overworld] {"text":"ブラッドムーンは朝とともに終わった。","color":"gray"}
function overlimit:blood_moon/end
