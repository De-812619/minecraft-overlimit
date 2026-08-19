"""26.2 OverworldBiomeBuilder → multi_noise biome entries.

Port of net.minecraft.world.level.biome.OverworldBiomeBuilder (client 26.2).
Used so Blood World can keep overworld climate and splice nether biomes in.
"""
from __future__ import annotations

from typing import Callable

Param = tuple[float, float]


def point(v: float) -> Param:
    return (v, v)


def span(a: float | Param, b: float | Param) -> Param:
    amin, amax = (a, a) if isinstance(a, (int, float)) else a
    bmin, bmax = (b, b) if isinstance(b, (int, float)) else b
    return (min(amin, bmin), max(amax, bmax))


def encode_param(p: Param) -> float | list[float]:
    if p[0] == p[1]:
        return p[0]
    return [p[0], p[1]]


def weirdness_max_neg(w: Param) -> bool:
    return w[1] < 0.0


B = {
    "deep_frozen_ocean": "minecraft:deep_frozen_ocean",
    "deep_cold_ocean": "minecraft:deep_cold_ocean",
    "deep_ocean": "minecraft:deep_ocean",
    "deep_lukewarm_ocean": "minecraft:deep_lukewarm_ocean",
    "warm_ocean": "minecraft:warm_ocean",
    "frozen_ocean": "minecraft:frozen_ocean",
    "cold_ocean": "minecraft:cold_ocean",
    "ocean": "minecraft:ocean",
    "lukewarm_ocean": "minecraft:lukewarm_ocean",
    "mushroom_fields": "minecraft:mushroom_fields",
    "snowy_plains": "minecraft:snowy_plains",
    "snowy_taiga": "minecraft:snowy_taiga",
    "taiga": "minecraft:taiga",
    "plains": "minecraft:plains",
    "forest": "minecraft:forest",
    "old_growth_spruce_taiga": "minecraft:old_growth_spruce_taiga",
    "flower_forest": "minecraft:flower_forest",
    "birch_forest": "minecraft:birch_forest",
    "dark_forest": "minecraft:dark_forest",
    "savanna": "minecraft:savanna",
    "jungle": "minecraft:jungle",
    "desert": "minecraft:desert",
    "ice_spikes": "minecraft:ice_spikes",
    "old_growth_pine_taiga": "minecraft:old_growth_pine_taiga",
    "sunflower_plains": "minecraft:sunflower_plains",
    "old_growth_birch_forest": "minecraft:old_growth_birch_forest",
    "sparse_jungle": "minecraft:sparse_jungle",
    "bamboo_jungle": "minecraft:bamboo_jungle",
    "meadow": "minecraft:meadow",
    "pale_garden": "minecraft:pale_garden",
    "savanna_plateau": "minecraft:savanna_plateau",
    "badlands": "minecraft:badlands",
    "wooded_badlands": "minecraft:wooded_badlands",
    "cherry_grove": "minecraft:cherry_grove",
    "eroded_badlands": "minecraft:eroded_badlands",
    "windswept_gravelly_hills": "minecraft:windswept_gravelly_hills",
    "windswept_hills": "minecraft:windswept_hills",
    "windswept_forest": "minecraft:windswept_forest",
    "windswept_savanna": "minecraft:windswept_savanna",
    "stony_shore": "minecraft:stony_shore",
    "swamp": "minecraft:swamp",
    "mangrove_swamp": "minecraft:mangrove_swamp",
    "frozen_river": "minecraft:frozen_river",
    "river": "minecraft:river",
    "snowy_beach": "minecraft:snowy_beach",
    "beach": "minecraft:beach",
    "jagged_peaks": "minecraft:jagged_peaks",
    "frozen_peaks": "minecraft:frozen_peaks",
    "stony_peaks": "minecraft:stony_peaks",
    "snowy_slopes": "minecraft:snowy_slopes",
    "grove": "minecraft:grove",
    "dripstone_caves": "minecraft:dripstone_caves",
    "lush_caves": "minecraft:lush_caves",
    "sulfur_caves": "minecraft:sulfur_caves",
    "deep_dark": "minecraft:deep_dark",
}


class OverworldBiomeBuilder:
    def __init__(self) -> None:
        self.FULL = span(-1.0, 1.0)
        self.temperatures = [
            span(-1.0, -0.45),
            span(-0.45, -0.15),
            span(-0.15, 0.2),
            span(0.2, 0.55),
            span(0.55, 1.0),
        ]
        self.humidities = [
            span(-1.0, -0.35),
            span(-0.35, -0.1),
            span(-0.1, 0.1),
            span(0.1, 0.3),
            span(0.3, 1.0),
        ]
        self.erosions = [
            span(-1.0, -0.78),
            span(-0.78, -0.375),
            span(-0.375, -0.2225),
            span(-0.2225, 0.05),
            span(0.05, 0.45),
            span(0.45, 0.55),
            span(0.55, 1.0),
        ]
        self.FROZEN = self.temperatures[0]
        self.UNFROZEN = span(self.temperatures[1], self.temperatures[4])
        self.mushroom = span(-1.2, -1.05)
        self.deep_ocean = span(-1.05, -0.455)
        self.ocean = span(-0.455, -0.19)
        self.coast = span(-0.19, -0.11)
        self.inland = span(-0.11, 0.55)
        self.near = span(-0.11, 0.03)
        self.mid = span(0.03, 0.3)
        self.far = span(0.3, 1.0)
        self.OCEANS = [
            [B["deep_frozen_ocean"], B["deep_cold_ocean"], B["deep_ocean"], B["deep_lukewarm_ocean"], B["warm_ocean"]],
            [B["frozen_ocean"], B["cold_ocean"], B["ocean"], B["lukewarm_ocean"], B["warm_ocean"]],
        ]
        self.MIDDLE = [
            [B["snowy_plains"], B["snowy_plains"], B["snowy_plains"], B["snowy_taiga"], B["taiga"]],
            [B["plains"], B["plains"], B["forest"], B["taiga"], B["old_growth_spruce_taiga"]],
            [B["flower_forest"], B["plains"], B["forest"], B["birch_forest"], B["dark_forest"]],
            [B["savanna"], B["savanna"], B["forest"], B["jungle"], B["jungle"]],
            [B["desert"], B["desert"], B["desert"], B["desert"], B["desert"]],
        ]
        self.MIDDLE_V = [
            [B["ice_spikes"], None, B["snowy_taiga"], None, None],
            [None, None, None, None, B["old_growth_pine_taiga"]],
            [B["sunflower_plains"], None, None, B["old_growth_birch_forest"], None],
            [None, None, B["plains"], B["sparse_jungle"], B["bamboo_jungle"]],
            [None, None, None, None, None],
        ]
        self.PLATEAU = [
            [B["snowy_plains"], B["snowy_plains"], B["snowy_plains"], B["snowy_taiga"], B["snowy_taiga"]],
            [B["meadow"], B["meadow"], B["forest"], B["taiga"], B["old_growth_spruce_taiga"]],
            [B["meadow"], B["meadow"], B["meadow"], B["meadow"], B["pale_garden"]],
            [B["savanna_plateau"], B["savanna_plateau"], B["forest"], B["forest"], B["jungle"]],
            [B["badlands"], B["badlands"], B["badlands"], B["wooded_badlands"], B["wooded_badlands"]],
        ]
        self.PLATEAU_V = [
            [B["ice_spikes"], None, None, None, None],
            [B["cherry_grove"], None, B["meadow"], B["meadow"], B["old_growth_pine_taiga"]],
            [B["cherry_grove"], B["cherry_grove"], B["forest"], B["birch_forest"], None],
            [None, None, None, None, None],
            [B["eroded_badlands"], B["eroded_badlands"], None, None, None],
        ]
        self.SHATTERED = [
            [B["windswept_gravelly_hills"], B["windswept_gravelly_hills"], B["windswept_hills"], B["windswept_forest"], B["windswept_forest"]],
            [B["windswept_gravelly_hills"], B["windswept_gravelly_hills"], B["windswept_hills"], B["windswept_forest"], B["windswept_forest"]],
            [B["windswept_hills"], B["windswept_hills"], B["windswept_hills"], B["windswept_forest"], B["windswept_forest"]],
            [None, None, None, None, None],
            [None, None, None, None, None],
        ]
        self.out: list[tuple[str, dict]] = []

    def add_surface(self, t: Param, h: Param, c: Param, e: Param, w: Param, biome: str) -> None:
        for depth in (0.0, 1.0):
            self.out.append(
                (
                    biome,
                    {
                        "temperature": encode_param(t),
                        "humidity": encode_param(h),
                        "continentalness": encode_param(c),
                        "erosion": encode_param(e),
                        "depth": depth,
                        "weirdness": encode_param(w),
                        "offset": 0.0,
                    },
                )
            )

    def add_underground(self, t: Param, h: Param, c: Param, e: Param, w: Param, biome: str) -> None:
        self.out.append(
            (
                biome,
                {
                    "temperature": encode_param(t),
                    "humidity": encode_param(h),
                    "continentalness": encode_param(c),
                    "erosion": encode_param(e),
                    "depth": [0.2, 0.9],
                    "weirdness": encode_param(w),
                    "offset": 0.0,
                },
            )
        )

    def add_bottom(self, t: Param, h: Param, c: Param, e: Param, w: Param, biome: str) -> None:
        self.out.append(
            (
                biome,
                {
                    "temperature": encode_param(t),
                    "humidity": encode_param(h),
                    "continentalness": encode_param(c),
                    "erosion": encode_param(e),
                    "depth": 1.1,
                    "weirdness": encode_param(w),
                    "offset": 0.0,
                },
            )
        )

    def pick_middle(self, ti: int, hi: int, w: Param) -> str:
        if weirdness_max_neg(w):
            return self.MIDDLE[ti][hi]
        variant = self.MIDDLE_V[ti][hi]
        return variant if variant is not None else self.MIDDLE[ti][hi]

    def pick_badlands(self, hi: int, w: Param) -> str:
        if hi < 2:
            return B["badlands"] if weirdness_max_neg(w) else B["eroded_badlands"]
        return B["badlands"] if hi < 3 else B["wooded_badlands"]

    def pick_middle_or_badlands(self, ti: int, hi: int, w: Param) -> str:
        return self.pick_badlands(hi, w) if ti == 4 else self.pick_middle(ti, hi, w)

    def pick_slope(self, ti: int, hi: int, w: Param) -> str:
        if ti >= 3:
            return self.pick_plateau(ti, hi, w)
        return B["snowy_slopes"] if hi <= 1 else B["grove"]

    def pick_middle_or_badlands_or_slope(self, ti: int, hi: int, w: Param) -> str:
        return self.pick_slope(ti, hi, w) if ti == 0 else self.pick_middle_or_badlands(ti, hi, w)

    def maybe_windswept_savanna(self, ti: int, hi: int, w: Param, underlying: str) -> str:
        if ti > 1 and hi < 4 and not weirdness_max_neg(w):
            return B["windswept_savanna"]
        return underlying

    def pick_beach(self, ti: int, _hi: int) -> str:
        if ti == 0:
            return B["snowy_beach"]
        return B["desert"] if ti == 4 else B["beach"]

    def pick_shattered_coast(self, ti: int, hi: int, w: Param) -> str:
        base = self.pick_middle(ti, hi, w) if not weirdness_max_neg(w) else self.pick_beach(ti, hi)
        return self.maybe_windswept_savanna(ti, hi, w, base)

    def pick_plateau(self, ti: int, hi: int, w: Param) -> str:
        if not weirdness_max_neg(w):
            variant = self.PLATEAU_V[ti][hi]
            if variant is not None:
                return variant
        return self.PLATEAU[ti][hi]

    def pick_peak(self, ti: int, hi: int, w: Param) -> str:
        if ti <= 2:
            return B["jagged_peaks"] if weirdness_max_neg(w) else B["frozen_peaks"]
        return B["stony_peaks"] if ti == 3 else self.pick_badlands(hi, w)

    def pick_shattered(self, ti: int, hi: int, w: Param) -> str:
        biome = self.SHATTERED[ti][hi]
        return self.pick_middle(ti, hi, w) if biome is None else biome

    def each_th(self, fn: Callable[[int, int, Param, Param], None], w: Param) -> None:
        for ti, t in enumerate(self.temperatures):
            for hi, h in enumerate(self.humidities):
                fn(ti, hi, t, h)

    def add_peaks(self, w: Param) -> None:
        def inner(ti: int, hi: int, t: Param, h: Param) -> None:
            middle = self.pick_middle(ti, hi, w)
            mid_hot = self.pick_middle_or_badlands(ti, hi, w)
            mid_hot_slope = self.pick_middle_or_badlands_or_slope(ti, hi, w)
            plateau = self.pick_plateau(ti, hi, w)
            shattered = self.pick_shattered(ti, hi, w)
            shattered_ws = self.maybe_windswept_savanna(ti, hi, w, shattered)
            peak = self.pick_peak(ti, hi, w)
            self.add_surface(t, h, span(self.coast, self.far), self.erosions[0], w, peak)
            self.add_surface(t, h, span(self.coast, self.near), self.erosions[1], w, mid_hot_slope)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[1], w, peak)
            self.add_surface(t, h, span(self.coast, self.near), span(self.erosions[2], self.erosions[3]), w, middle)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[2], w, plateau)
            self.add_surface(t, h, self.mid, self.erosions[3], w, mid_hot)
            self.add_surface(t, h, self.far, self.erosions[3], w, plateau)
            self.add_surface(t, h, span(self.coast, self.far), self.erosions[4], w, middle)
            self.add_surface(t, h, span(self.coast, self.near), self.erosions[5], w, shattered_ws)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[5], w, shattered)
            self.add_surface(t, h, span(self.coast, self.far), self.erosions[6], w, middle)

        self.each_th(inner, w)

    def add_high(self, w: Param) -> None:
        def inner(ti: int, hi: int, t: Param, h: Param) -> None:
            middle = self.pick_middle(ti, hi, w)
            mid_hot = self.pick_middle_or_badlands(ti, hi, w)
            mid_hot_slope = self.pick_middle_or_badlands_or_slope(ti, hi, w)
            plateau = self.pick_plateau(ti, hi, w)
            shattered = self.pick_shattered(ti, hi, w)
            middle_ws = self.maybe_windswept_savanna(ti, hi, w, middle)
            slope = self.pick_slope(ti, hi, w)
            peak = self.pick_peak(ti, hi, w)
            self.add_surface(t, h, self.coast, span(self.erosions[0], self.erosions[1]), w, middle)
            self.add_surface(t, h, self.near, self.erosions[0], w, slope)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[0], w, peak)
            self.add_surface(t, h, self.near, self.erosions[1], w, mid_hot_slope)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[1], w, slope)
            self.add_surface(t, h, span(self.coast, self.near), span(self.erosions[2], self.erosions[3]), w, middle)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[2], w, plateau)
            self.add_surface(t, h, self.mid, self.erosions[3], w, mid_hot)
            self.add_surface(t, h, self.far, self.erosions[3], w, plateau)
            self.add_surface(t, h, span(self.coast, self.far), self.erosions[4], w, middle)
            self.add_surface(t, h, span(self.coast, self.near), self.erosions[5], w, middle_ws)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[5], w, shattered)
            self.add_surface(t, h, span(self.coast, self.far), self.erosions[6], w, middle)

        self.each_th(inner, w)

    def add_mid(self, w: Param) -> None:
        self.add_surface(self.FULL, self.FULL, self.coast, span(self.erosions[0], self.erosions[2]), w, B["stony_shore"])
        self.add_surface(
            span(self.temperatures[1], self.temperatures[2]),
            self.FULL,
            span(self.near, self.far),
            self.erosions[6],
            w,
            B["swamp"],
        )
        self.add_surface(
            span(self.temperatures[3], self.temperatures[4]),
            self.FULL,
            span(self.near, self.far),
            self.erosions[6],
            w,
            B["mangrove_swamp"],
        )

        def inner(ti: int, hi: int, t: Param, h: Param) -> None:
            middle = self.pick_middle(ti, hi, w)
            mid_hot = self.pick_middle_or_badlands(ti, hi, w)
            mid_hot_slope = self.pick_middle_or_badlands_or_slope(ti, hi, w)
            shattered = self.pick_shattered(ti, hi, w)
            plateau = self.pick_plateau(ti, hi, w)
            beach = self.pick_beach(ti, hi)
            middle_ws = self.maybe_windswept_savanna(ti, hi, w, middle)
            shattered_coast = self.pick_shattered_coast(ti, hi, w)
            slope = self.pick_slope(ti, hi, w)
            self.add_surface(t, h, span(self.near, self.far), self.erosions[0], w, slope)
            self.add_surface(t, h, span(self.near, self.mid), self.erosions[1], w, mid_hot_slope)
            self.add_surface(t, h, self.far, self.erosions[1], w, slope if ti == 0 else plateau)
            self.add_surface(t, h, self.near, self.erosions[2], w, middle)
            self.add_surface(t, h, self.mid, self.erosions[2], w, mid_hot)
            self.add_surface(t, h, self.far, self.erosions[2], w, plateau)
            self.add_surface(t, h, span(self.coast, self.near), self.erosions[3], w, middle)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[3], w, mid_hot)
            if weirdness_max_neg(w):
                self.add_surface(t, h, self.coast, self.erosions[4], w, beach)
                self.add_surface(t, h, span(self.near, self.far), self.erosions[4], w, middle)
            else:
                self.add_surface(t, h, span(self.coast, self.far), self.erosions[4], w, middle)
            self.add_surface(t, h, self.coast, self.erosions[5], w, shattered_coast)
            self.add_surface(t, h, self.near, self.erosions[5], w, middle_ws)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[5], w, shattered)
            if weirdness_max_neg(w):
                self.add_surface(t, h, self.coast, self.erosions[6], w, beach)
            else:
                self.add_surface(t, h, self.coast, self.erosions[6], w, middle)
            if ti == 0:
                self.add_surface(t, h, span(self.near, self.far), self.erosions[6], w, middle)

        self.each_th(inner, w)

    def add_low(self, w: Param) -> None:
        self.add_surface(self.FULL, self.FULL, self.coast, span(self.erosions[0], self.erosions[2]), w, B["stony_shore"])
        self.add_surface(
            span(self.temperatures[1], self.temperatures[2]),
            self.FULL,
            span(self.near, self.far),
            self.erosions[6],
            w,
            B["swamp"],
        )
        self.add_surface(
            span(self.temperatures[3], self.temperatures[4]),
            self.FULL,
            span(self.near, self.far),
            self.erosions[6],
            w,
            B["mangrove_swamp"],
        )

        def inner(ti: int, hi: int, t: Param, h: Param) -> None:
            middle = self.pick_middle(ti, hi, w)
            mid_hot = self.pick_middle_or_badlands(ti, hi, w)
            mid_hot_slope = self.pick_middle_or_badlands_or_slope(ti, hi, w)
            beach = self.pick_beach(ti, hi)
            middle_ws = self.maybe_windswept_savanna(ti, hi, w, middle)
            shattered_coast = self.pick_shattered_coast(ti, hi, w)
            self.add_surface(t, h, self.near, span(self.erosions[0], self.erosions[1]), w, mid_hot)
            self.add_surface(t, h, span(self.mid, self.far), span(self.erosions[0], self.erosions[1]), w, mid_hot_slope)
            self.add_surface(t, h, self.near, span(self.erosions[2], self.erosions[3]), w, middle)
            self.add_surface(t, h, span(self.mid, self.far), span(self.erosions[2], self.erosions[3]), w, mid_hot)
            self.add_surface(t, h, self.coast, span(self.erosions[3], self.erosions[4]), w, beach)
            self.add_surface(t, h, span(self.near, self.far), self.erosions[4], w, middle)
            self.add_surface(t, h, self.coast, self.erosions[5], w, shattered_coast)
            self.add_surface(t, h, self.near, self.erosions[5], w, middle_ws)
            self.add_surface(t, h, span(self.mid, self.far), self.erosions[5], w, middle)
            self.add_surface(t, h, self.coast, self.erosions[6], w, beach)
            if ti == 0:
                self.add_surface(t, h, span(self.near, self.far), self.erosions[6], w, middle)

        self.each_th(inner, w)

    def add_valleys(self, w: Param) -> None:
        stony_or_frozen = B["stony_shore"] if weirdness_max_neg(w) else B["frozen_river"]
        stony_or_river = B["stony_shore"] if weirdness_max_neg(w) else B["river"]
        self.add_surface(self.FROZEN, self.FULL, self.coast, span(self.erosions[0], self.erosions[1]), w, stony_or_frozen)
        self.add_surface(self.UNFROZEN, self.FULL, self.coast, span(self.erosions[0], self.erosions[1]), w, stony_or_river)
        self.add_surface(self.FROZEN, self.FULL, self.near, span(self.erosions[0], self.erosions[1]), w, B["frozen_river"])
        self.add_surface(self.UNFROZEN, self.FULL, self.near, span(self.erosions[0], self.erosions[1]), w, B["river"])
        self.add_surface(self.FROZEN, self.FULL, span(self.coast, self.far), span(self.erosions[2], self.erosions[5]), w, B["frozen_river"])
        self.add_surface(self.UNFROZEN, self.FULL, span(self.coast, self.far), span(self.erosions[2], self.erosions[5]), w, B["river"])
        self.add_surface(self.FROZEN, self.FULL, self.coast, self.erosions[6], w, B["frozen_river"])
        self.add_surface(self.UNFROZEN, self.FULL, self.coast, self.erosions[6], w, B["river"])
        self.add_surface(
            span(self.temperatures[1], self.temperatures[2]),
            self.FULL,
            span(self.inland, self.far),
            self.erosions[6],
            w,
            B["swamp"],
        )
        self.add_surface(
            span(self.temperatures[3], self.temperatures[4]),
            self.FULL,
            span(self.inland, self.far),
            self.erosions[6],
            w,
            B["mangrove_swamp"],
        )
        self.add_surface(self.FROZEN, self.FULL, span(self.inland, self.far), self.erosions[6], w, B["frozen_river"])

        def inner(ti: int, hi: int, t: Param, h: Param) -> None:
            mid_hot = self.pick_middle_or_badlands(ti, hi, w)
            self.add_surface(t, h, span(self.mid, self.far), span(self.erosions[0], self.erosions[1]), w, mid_hot)

        self.each_th(inner, w)

    def add_off_coast(self) -> None:
        self.add_surface(self.FULL, self.FULL, self.mushroom, self.FULL, self.FULL, B["mushroom_fields"])
        for ti, t in enumerate(self.temperatures):
            self.add_surface(t, self.FULL, self.deep_ocean, self.FULL, self.FULL, self.OCEANS[0][ti])
            self.add_surface(t, self.FULL, self.ocean, self.FULL, self.FULL, self.OCEANS[1][ti])

    def add_inland(self) -> None:
        self.add_mid(span(-1.0, -0.93333334))
        self.add_high(span(-0.93333334, -0.7666667))
        self.add_peaks(span(-0.7666667, -0.56666666))
        self.add_high(span(-0.56666666, -0.4))
        self.add_mid(span(-0.4, -0.26666668))
        self.add_low(span(-0.26666668, -0.05))
        self.add_valleys(span(-0.05, 0.05))
        self.add_low(span(0.05, 0.26666668))
        self.add_mid(span(0.26666668, 0.4))
        self.add_high(span(0.4, 0.56666666))
        self.add_peaks(span(0.56666666, 0.7666667))
        self.add_high(span(0.7666667, 0.93333334))
        self.add_mid(span(0.93333334, 1.0))

    def add_caves(self) -> None:
        self.add_underground(self.FULL, self.FULL, span(0.8, 1.0), self.FULL, self.FULL, B["dripstone_caves"])
        self.add_underground(self.FULL, span(0.7, 1.0), self.FULL, self.FULL, self.FULL, B["lush_caves"])
        self.add_underground(
            self.FULL,
            self.FULL,
            span(self.coast, self.inland),
            span(self.erosions[5], self.erosions[6]),
            span(-1.1, -0.85),
            B["sulfur_caves"],
        )
        self.add_bottom(self.FULL, self.FULL, self.FULL, span(self.erosions[0], self.erosions[1]), self.FULL, B["deep_dark"])

    def build(self) -> list[tuple[str, dict]]:
        self.out = []
        self.add_off_coast()
        self.add_inland()
        self.add_caves()
        return self.out
