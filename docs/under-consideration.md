# 検討中などのメモ

## ▼エンドゲームループ（進行中）
- ヒート / 世界圧 / 消耗 / 抑止で「イベント作業化」を防ぐ方針
- **抑止:** 静寂のトーテム実装済み → [EVENT_SUPPRESS.md](./EVENT_SUPPRESS.md)
- **ヒート:** 実装済み → [HEAT.md](./HEAT.md)
- **世界圧:** 実装済み → [WORLD_PRESSURE.md](./WORLD_PRESSURE.md)
- **次:** 消耗

## ▼カスタムエンチャントの追加
- 名前：豪欲
- 付与：ヘルメット
- 効果：敵Mobを倒した時のXPが2倍になる

## ■改善

## ▼エンチャントの説明について
- カーソルが乗っている時にシフト押下で各エンチャントの効果を表示したい  
↑データパックで実現できないので本（図鑑）を作る方針  
[このJSONで管理中（内容はまだ未確定）](/Users/okanoueyuuichi/minecraft/datapacks/over_limit_pack/docs/enchant_guide.json)

## ▼データパックの肥大化に伴う懸念
- 現状の負荷把握
- Mod化の検討（負荷や効率を考慮）