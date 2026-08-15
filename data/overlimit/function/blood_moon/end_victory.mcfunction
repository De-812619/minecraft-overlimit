title @a[predicate=overlimit:in_overworld] times 10 60 20
title @a[predicate=overlimit:in_overworld] title {"text":"ブラッドムーン","color":"gold"}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"100体撃破","color":"yellow"}
tellraw @a[predicate=overlimit:in_overworld] {"text":"ブラッドムーンを押し返した。報酬のエンチャント本を受け取った。","color":"gold"}
execute as @a[predicate=overlimit:in_overworld] run function overlimit:blood_moon/give_book
function overlimit:blood_moon/end
