/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class CharmFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaCharmCreate(lua_State* L);
	static int luaCharmName(lua_State* L);
	static int luaCharmDescription(lua_State* L);
	static int luaCharmCategory(lua_State* L);
	static int luaCharmType(lua_State* L);
	static int luaCharmPoints(lua_State* L);
	static int luaCharmDamageType(lua_State* L);
	static int luaCharmPercentage(lua_State* L);
	static int luaCharmChance(lua_State* L);
	static int luaCharmMessageCancel(lua_State* L);
	static int luaCharmMessageServerLog(lua_State* L);
	static int luaCharmEffect(lua_State* L);
	static int luaCharmCastSound(lua_State* L);
	static int luaCharmImpactSound(lua_State* L);
};
