/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

enum class ForgeAction_t : uint8_t {
	FUSION = 0,
	TRANSFER = 1,
	DUSTTOSLIVERS = 2,
	SLIVERSTOCORES = 3,
	INCREASELIMIT = 4
};
