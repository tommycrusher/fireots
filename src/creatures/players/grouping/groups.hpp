/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#include "declarations.hpp"

struct Group {
	std::string name;
	std::array<bool, magic_enum::enum_integer(PlayerFlags_t::FlagLast)> flags { false };
	uint32_t maxDepotItems;
	uint32_t maxVipEntries;
	uint16_t id;
	bool access;
};

class Groups {
public:
	static uint8_t getFlagNumber(PlayerFlags_t playerFlags);
	static PlayerFlags_t getFlagFromNumber(uint8_t value);
	bool reload() const;
	bool load();
	Group* getGroup(uint16_t id);
	std::vector<Group> &getGroups() {
		return groups_vector;
	}

private:
	std::vector<Group> groups_vector;
};
