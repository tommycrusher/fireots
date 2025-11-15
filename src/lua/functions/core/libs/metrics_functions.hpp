/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#include "lua/scripts/luascript.hpp"

class MetricsFunctions final : public LuaScriptInterface {
public:
	static void init(lua_State* L);

private:
	static int luaMetricsAddCounter(lua_State* L);
	static std::map<std::string, std::string> getAttributes(lua_State* L, int32_t index);
};
