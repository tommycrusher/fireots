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

class WebhookFunctions final : LuaScriptInterface {
public:
	static void init(lua_State* L) {
		registerTable(L, "Webhook");
		registerMethod(L, "Webhook", "sendMessage", WebhookFunctions::luaWebhookSendMessage);
	}

private:
	static int luaWebhookSendMessage(lua_State* L);
};
