/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class TeleportFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaTeleportCreate(lua_State* L);
	static int luaTeleportGetDestination(lua_State* L);
	static int luaTeleportSetDestination(lua_State* L);
};
