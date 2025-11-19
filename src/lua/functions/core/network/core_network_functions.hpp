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
#include "lua/functions/core/network/network_message_functions.hpp"
#include "lua/functions/core/network/webhook_functions.hpp"

class CoreNetworkFunctions final : LuaScriptInterface {
public:
	static void init(lua_State* L) {
		NetworkMessageFunctions::init(L);
		WebhookFunctions::init(L);
	}

private:
};
