/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#ifndef USE_PRECOMPILED_HEADERS
	#include <parallel_hashmap/phmap.h>
	#include <cstdint>
#endif

struct AccountInfo {
	uint32_t id = 0;
	uint32_t premiumRemainingDays = 0;
	time_t premiumLastDay = 0;
	uint8_t accountType = 0;
	phmap::flat_hash_map<std::string, uint64_t> players;
	bool oldProtocol = false;
	time_t sessionExpires = 0;
	uint32_t premiumDaysPurchased = 0;
	uint32_t creationTime = 0;
};
