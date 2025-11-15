/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#include "database/database.hpp"

class DatabaseManager {
public:
	static bool tableExists(const std::string &table);

	static int32_t getDatabaseVersion();
	static bool isDatabaseSetup();

	static bool optimizeTables();
	static void updateDatabase();

	static bool getDatabaseConfig(const std::string &config, int32_t &value);
	static void registerDatabaseConfig(const std::string &config, int32_t value);
};
