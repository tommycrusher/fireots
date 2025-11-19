/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class DBFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaDatabaseAsyncExecute(lua_State* L);
	static int luaDatabaseAsyncStoreQuery(lua_State* L);
	static int luaDatabaseEscapeBlob(lua_State* L);
	static int luaDatabaseEscapeString(lua_State* L);
	static int luaDatabaseExecute(lua_State* L);
	static int luaDatabaseLastInsertId(lua_State* L);
	static int luaDatabaseStoreQuery(lua_State* L);
	static int luaDatabaseTableExists(lua_State* L);
};
