/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class Bank;

class BankFunctions {
public:
	static void init(lua_State* L);

private:
	static int luaBankCredit(lua_State* L);
	static int luaBankDebit(lua_State* L);
	static int luaBankBalance(lua_State* L);
	static int luaBankHasBalance(lua_State* L);
	static int luaBankTransfer(lua_State* L);
	static int luaBankTransferToGuild(lua_State* L);
	static int luaBankWithdraw(lua_State* L);
	static int luaBankDeposit(lua_State* L);

	static std::shared_ptr<Bank> getBank(lua_State* L, int32_t arg, bool isGuild = false);
};
