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
#include "lua/functions/core/libs/bit_functions.hpp"
#include "lua/functions/core/libs/db_functions.hpp"
#include "lua/functions/core/libs/result_functions.hpp"
#include "lua/functions/core/libs/logger_functions.hpp"
#include "lua/functions/core/libs/metrics_functions.hpp"
#include "lua/functions/core/libs/kv_functions.hpp"

class CoreLibsFunctions final : LuaScriptInterface {
public:
	static void init(lua_State* L) {
		BitFunctions::init(L);
		DBFunctions::init(L);
		ResultFunctions::init(L);
		LoggerFunctions::init(L);
		MetricsFunctions::init(L);
		KVFunctions::init(L);
	}

private:
};
