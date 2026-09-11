# 足元4方向 → 頭上4方向 → 直下4方向 → 真上・真下 → 足元。ドア囲みでも隣接を優先してチェスト化する。
$execute align xyz positioned ~1.5 ~0.5 ~0.5 if function $(fn) run return 1
$execute align xyz positioned ~-0.5 ~0.5 ~0.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~0.5 ~1.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~0.5 ~-0.5 if function $(fn) run return 1
$execute align xyz positioned ~1.5 ~1.5 ~0.5 if function $(fn) run return 1
$execute align xyz positioned ~-0.5 ~1.5 ~0.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~1.5 ~1.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~1.5 ~-0.5 if function $(fn) run return 1
$execute align xyz positioned ~1.5 ~-0.5 ~0.5 if function $(fn) run return 1
$execute align xyz positioned ~-0.5 ~-0.5 ~0.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~-0.5 ~1.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~-0.5 ~-0.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~1.5 ~0.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~-0.5 ~0.5 if function $(fn) run return 1
$execute align xyz positioned ~0.5 ~0.5 ~0.5 if function $(fn) run return 1
$return run function $(give)
