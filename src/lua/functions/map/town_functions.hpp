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

class TownFunctions final : LuaScriptInterface {
public:
	static void init(lua_State* L) {
		registerSharedClass(L, "Town", "", TownFunctions::luaTownCreate);
		registerMetaMethod(L, "Town", "__eq", TownFunctions::luaUserdataCompare);

		registerMethod(L, "Town", "getId", TownFunctions::luaTownGetId);
		registerMethod(L, "Town", "getName", TownFunctions::luaTownGetName);
		registerMethod(L, "Town", "getTemplePosition", TownFunctions::luaTownGetTemplePosition);
	}

private:
	static int luaTownCreate(lua_State* L);

	static int luaTownGetId(lua_State* L);
	static int luaTownGetName(lua_State* L);
	static int luaTownGetTemplePosition(lua_State* L);
};
