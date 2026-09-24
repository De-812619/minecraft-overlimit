package dev.de812619.overlimit;

import com.mojang.brigadier.context.CommandContext;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.core.BlockPos;
import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.tags.TagKey;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.state.BlockState;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * {@code near_light_aligned.mcfunction} と同じ順で {@code #overlimit:spawn_lights} を見る。
 * 光源ありは 1、無しは 0。読み取れないときは湧かない側（1）。
 */
final class SpawnLights {
	private static final TagKey<Block> SPAWN_LIGHTS = TagKey.create(
		Registries.BLOCK,
		Identifier.fromNamespaceAndPath("overlimit", "spawn_lights")
	);
	private static final String RESOURCE = "data/overlimit/function/blood_moon/near_light_aligned.mcfunction";
	private static final Pattern OFFSET = Pattern.compile(
		"^execute if block ~(-?\\d+) ~(-?\\d+) ~(-?\\d+) #overlimit:spawn_lights run return 1$"
	);

	private static short[] offsets;
	private static boolean broken;

	private SpawnLights() {
	}

	static int scan(CommandContext<CommandSourceStack> ctx) {
		short[] table = offsets();
		if (table == null) {
			return 1;
		}
		CommandSourceStack source = ctx.getSource();
		ServerLevel level = source.getLevel();
		BlockPos origin = BlockPos.containing(source.getPosition());
		for (int i = 0; i < table.length; i += 3) {
			BlockPos pos = origin.offset(table[i], table[i + 1], table[i + 2]);
			if (!level.isLoaded(pos)) {
				continue;
			}
			BlockState state = level.getBlockState(pos);
			if (state.is(SPAWN_LIGHTS)) {
				return 1;
			}
		}
		return 0;
	}

	private static short[] offsets() {
		if (offsets != null || broken) {
			return offsets;
		}
		List<Short> found = new ArrayList<>();
		ClassLoader loader = SpawnLights.class.getClassLoader();
		try (InputStream in = loader.getResourceAsStream(RESOURCE)) {
			if (in == null) {
				broken = true;
				OverlimitMod.LOGGER.error("Missing spawn-light offset list {}", RESOURCE);
				return null;
			}
			try (BufferedReader reader = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
				String line;
				int lineNo = 0;
				while ((line = reader.readLine()) != null) {
					lineNo++;
					if (line.isEmpty() || line.charAt(0) == '#' || line.equals("return fail")) {
						continue;
					}
					Matcher matcher = OFFSET.matcher(line);
					if (!matcher.matches()) {
						broken = true;
						OverlimitMod.LOGGER.error("Unexpected spawn-light line {}:{}", RESOURCE, lineNo);
						return null;
					}
					found.add(Short.parseShort(matcher.group(1)));
					found.add(Short.parseShort(matcher.group(2)));
					found.add(Short.parseShort(matcher.group(3)));
				}
			}
		} catch (IOException ex) {
			broken = true;
			OverlimitMod.LOGGER.error("Failed to read {}", RESOURCE, ex);
			return null;
		}
		if (found.isEmpty()) {
			broken = true;
			OverlimitMod.LOGGER.error("Spawn-light offset list is empty");
			return null;
		}
		offsets = new short[found.size()];
		for (int i = 0; i < found.size(); i++) {
			offsets[i] = found.get(i);
		}
		OverlimitMod.LOGGER.info("Spawn light offsets: {}", offsets.length / 3);
		return offsets;
	}
}
