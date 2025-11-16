/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#include "lua/functions/creatures/combat/condition_functions.hpp"
#include "lua/functions/creatures/combat/spell_functions.hpp"
#include "lua/functions/creatures/combat/variant_functions.hpp"

class CombatFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaCombatCreate(lua_State* L);

	static int luaCombatSetParameter(lua_State* L);
	static int luaCombatSetFormula(lua_State* L);

	static int luaCombatSetArea(lua_State* L);
	static int luaCombatSetCondition(lua_State* L);
	static int luaCombatSetCallback(lua_State* L);
	static int luaCombatSetOrigin(lua_State* L);

	static int luaCombatExecute(lua_State* L);
};
