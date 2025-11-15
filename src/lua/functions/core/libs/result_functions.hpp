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

class ResultFunctions final : LuaScriptInterface {
public:
	static void init(lua_State* L) {
		registerTable(L, "Result");
		registerMethod(L, "Result", "getNumber", ResultFunctions::luaResultGetNumber);
		registerMethod(L, "Result", "getString", ResultFunctions::luaResultGetString);
		registerMethod(L, "Result", "getStream", ResultFunctions::luaResultGetStream);
		registerMethod(L, "Result", "next", ResultFunctions::luaResultNext);
		registerMethod(L, "Result", "free", ResultFunctions::luaResultFree);
	}

private:
	static int luaResultFree(lua_State* L);
	static int luaResultGetNumber(lua_State* L);
	static int luaResultGetStream(lua_State* L);
	static int luaResultGetString(lua_State* L);
	static int luaResultNext(lua_State* L);
};
