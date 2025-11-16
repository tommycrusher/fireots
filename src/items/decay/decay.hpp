/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class Item;

class Decay {
public:
	Decay() = default;

	Decay(const Decay &) = delete;
	void operator=(const Decay &) = delete;

	static Decay &getInstance();

	void startDecay(const std::shared_ptr<Item> &item);
	void stopDecay(const std::shared_ptr<Item> &item);

private:
	void checkDecay();
	static void internalDecayItem(const std::shared_ptr<Item> &item);

	uint32_t eventId { 0 };
	// order is important, so we use an std::map
	std::map<int64_t, std::vector<std::shared_ptr<Item>>> decayMap;
};

constexpr auto g_decay = Decay::getInstance;
