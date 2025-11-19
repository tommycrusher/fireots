/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class ContainerFunctions {
private:
	static void init(lua_State* L);

	static int luaContainerCreate(lua_State* L);

	static int luaContainerGetSize(lua_State* L);
	static int luaContainerGetMaxCapacity(lua_State* L);
	static int luaContainerGetCapacity(lua_State* L);
	static int luaContainerGetEmptySlots(lua_State* L);

	static int luaContainerGetContentDescription(lua_State* L);
	static int luaContainerGetItems(lua_State* L);
	static int luaContainerGetItemHoldingCount(lua_State* L);
	static int luaContainerGetItemCountById(lua_State* L);

	static int luaContainerGetItem(lua_State* L);
	static int luaContainerHasItem(lua_State* L);
	static int luaContainerAddItem(lua_State* L);
	static int luaContainerAddItemEx(lua_State* L);

	static int luaContainerGetCorpseOwner(lua_State* L);
	static int luaContainerRegisterReward(lua_State* L);

	friend class ItemFunctions;
};
