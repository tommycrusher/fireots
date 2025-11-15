/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

enum class CoinTransactionType : uint8_t {
	Add = 1,
	Remove = 2
};

enum class CoinType : uint8_t {
	Normal = 1,
	Tournament = 2,
	Transferable = 3
};
