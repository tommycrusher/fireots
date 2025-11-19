/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class PartyFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaPartyCreate(lua_State* L);
	static int luaPartyDisband(lua_State* L);
	static int luaPartyGetLeader(lua_State* L);
	static int luaPartySetLeader(lua_State* L);
	static int luaPartyGetMembers(lua_State* L);
	static int luaPartyGetMemberCount(lua_State* L);
	static int luaPartyGetInvitees(lua_State* L);
	static int luaPartyGetInviteeCount(lua_State* L);
	static int luaPartyGetUniqueVocationsCount(lua_State* L);
	static int luaPartyAddInvite(lua_State* L);
	static int luaPartyRemoveInvite(lua_State* L);
	static int luaPartyAddMember(lua_State* L);
	static int luaPartyRemoveMember(lua_State* L);
	static int luaPartyIsSharedExperienceActive(lua_State* L);
	static int luaPartyIsSharedExperienceEnabled(lua_State* L);
	static int luaPartyShareExperience(lua_State* L);
	static int luaPartySetSharedExperience(lua_State* L);
};
