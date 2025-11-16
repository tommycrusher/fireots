/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class GuildFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaGuildCreate(lua_State* L);

	static int luaGuildGetId(lua_State* L);
	static int luaGuildGetName(lua_State* L);
	static int luaGuildGetMembersOnline(lua_State* L);

	static int luaGuildGetBankBalance(lua_State* L);
	static int luaGuildSetBankBalance(lua_State* L);

	static int luaGuildAddRank(lua_State* L);
	static int luaGuildGetRankById(lua_State* L);
	static int luaGuildGetRankByLevel(lua_State* L);

	static int luaGuildGetMotd(lua_State* L);
	static int luaGuildSetMotd(lua_State* L);
};
