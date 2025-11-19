/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class CreatureEventFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaCreateCreatureEvent(lua_State* L);
	static int luaCreatureEventType(lua_State* L);
	static int luaCreatureEventRegister(lua_State* L);
	static int luaCreatureEventOnCallback(lua_State* L);
};
