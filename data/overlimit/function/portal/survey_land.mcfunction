# 抽選点から陸地の構造物を測量し、当たれば origin をそこへ書き換える。失敗なら抽選点のまま。
$execute in overlimit:blood_world positioned $(x) 64 $(z) run function overlimit:portal/survey_here
