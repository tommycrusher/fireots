/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class Guild;
using GuildWarVector = std::vector<uint32_t>;

class IOGuild {
public:
	static std::shared_ptr<Guild> loadGuild(uint32_t guildId);
	static void saveGuild(const std::shared_ptr<Guild> &guild);
	static uint32_t getGuildIdByName(const std::string &name);
	static void getWarList(uint32_t guildId, GuildWarVector &guildWarVector);
};
