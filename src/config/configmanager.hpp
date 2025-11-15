/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#include "config_enums.hpp"

using ConfigValue = std::variant<std::string, int32_t, bool, float>;

class ConfigManager {
public:
	ConfigManager() = default;

	// Singleton - ensures we don't accidentally copy it
	ConfigManager(const ConfigManager &) = delete;
	void operator=(const ConfigManager &) = delete;

	static ConfigManager &getInstance();

	bool load();
	bool reload();

	const std::string &setConfigFileLua(const std::string &what) {
		configFileLua = { what };
		return configFileLua;
	};
	[[nodiscard]] const std::string &getConfigFileLua() const {
		return configFileLua;
	};

	[[nodiscard]] const std::string &getString(const ConfigKey_t &key, std::string_view context) const;
	[[nodiscard]] int32_t getNumber(const ConfigKey_t &key, std::string_view context) const;
	[[nodiscard]] bool getBoolean(const ConfigKey_t &key, std::string_view context) const;
	[[nodiscard]] float getFloat(const ConfigKey_t &key, std::string_view context) const;

private:
	phmap::flat_hash_map<ConfigKey_t, ConfigValue> configs;
	std::string loadStringConfig(lua_State* L, const ConfigKey_t &key, const char* identifier, const std::string &defaultValue);
	int32_t loadIntConfig(lua_State* L, const ConfigKey_t &key, const char* identifier, const int32_t &defaultValue);
	bool loadBoolConfig(lua_State* L, const ConfigKey_t &key, const char* identifier, const bool &defaultValue);
	float loadFloatConfig(lua_State* L, const ConfigKey_t &key, const char* identifier, const float &defaultValue);

	std::string configFileLua = { "config.lua" };
	bool loaded = false;
};

constexpr auto g_configManager = ConfigManager::getInstance;
