/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class ResultFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaResultFree(lua_State* L);
	static int luaResultGetNumber(lua_State* L);
	static int luaResultGetStream(lua_State* L);
	static int luaResultGetString(lua_State* L);
	static int luaResultNext(lua_State* L);
};
