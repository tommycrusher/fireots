/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2023 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */
#pragma once

#include <iostream>
#include "lib/logging/log_with_spd_log.hpp"

class SoftSingleton {
public:
	explicit SoftSingleton(std::string id);

	// non-copyable
	SoftSingleton(const SoftSingleton &) = delete;
	void operator=(const SoftSingleton &) = delete;

	void increment();

	void decrement();

private:
	Logger &logger = g_logger();
	std::string id;
	int instance_count = 0;
};

class SoftSingletonGuard {
public:
	explicit SoftSingletonGuard(SoftSingleton &t);

	// non-copyable
	SoftSingletonGuard(const SoftSingletonGuard &) = delete;
	void operator=(const SoftSingletonGuard &) = delete;

	~SoftSingletonGuard();

private:
	SoftSingleton &tracker;
};
