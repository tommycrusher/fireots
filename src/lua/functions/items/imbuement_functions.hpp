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

class ImbuementFunctions final : LuaScriptInterface {
public:
	static void init(lua_State* L) {
		registerClass(L, "Imbuement", "", ImbuementFunctions::luaCreateImbuement);
		registerMetaMethod(L, "Imbuement", "__eq", ImbuementFunctions::luaUserdataCompare);

		registerMethod(L, "Imbuement", "getName", ImbuementFunctions::luaImbuementGetName);
		registerMethod(L, "Imbuement", "getId", ImbuementFunctions::luaImbuementGetId);
		registerMethod(L, "Imbuement", "getItems", ImbuementFunctions::luaImbuementGetItems);
		registerMethod(L, "Imbuement", "getBase", ImbuementFunctions::luaImbuementGetBase);
		registerMethod(L, "Imbuement", "getCategory", ImbuementFunctions::luaImbuementGetCategory);
		registerMethod(L, "Imbuement", "isPremium", ImbuementFunctions::luaImbuementIsPremium);
		registerMethod(L, "Imbuement", "getElementDamage", ImbuementFunctions::luaImbuementGetElementDamage);
		registerMethod(L, "Imbuement", "getCombatType", ImbuementFunctions::luaImbuementGetCombatType);
	}

private:
	static int luaCreateImbuement(lua_State* L);
	static int luaImbuementGetName(lua_State* L);
	static int luaImbuementGetId(lua_State* L);
	static int luaImbuementGetItems(lua_State* L);
	static int luaImbuementGetBase(lua_State* L);
	static int luaImbuementGetCategory(lua_State* L);
	static int luaImbuementIsPremium(lua_State* L);
	static int luaImbuementGetElementDamage(lua_State* L);
	static int luaImbuementGetCombatType(lua_State* L);
};
