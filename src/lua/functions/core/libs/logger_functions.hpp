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

class LoggerFunctions final : public LuaScriptInterface {
public:
	static void init(lua_State* L);

private:
	static int luaSpdlogDebug(lua_State* L);
	static int luaSpdlogError(lua_State* L);
	static int luaSpdlogInfo(lua_State* L);
	static int luaSpdlogWarn(lua_State* L);

	static int luaLoggerDebug(lua_State* L);
	static int luaLoggerError(lua_State* L);
	static int luaLoggerInfo(lua_State* L);
	static int luaLoggerWarn(lua_State* L);
	static int luaLoggerTrace(lua_State* L);
};
