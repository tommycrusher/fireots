/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class EventsSchedulerFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaEventsSchedulergetEventSLoot(lua_State* L);
	static int luaEventsSchedulergetEventSBossLoot(lua_State* L);
	static int luaEventsSchedulergetEventSSkill(lua_State* L);
	static int luaEventsSchedulergetEventSExp(lua_State* L);
	static int luaEventsSchedulergetSpawnMonsterSchedule(lua_State* L);
};
