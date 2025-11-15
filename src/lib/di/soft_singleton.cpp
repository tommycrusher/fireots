/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2023 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */
#include "pch.hpp"
#include "lib/di/soft_singleton.hpp"
#include "utils/tools.hpp"

SoftSingleton::SoftSingleton(std::string id) :
	id(std::move(id)) { }

void SoftSingleton::increment() {
	instance_count++;
	if (instance_count > 1) {
		logger.warn(
			"{} instances created for {}. This is a soft singleton, you probably want to use g_{} instead.",
			instance_count,
			id,
			asLowerCaseString(id)
		);
	}
}

void SoftSingleton::decrement() {
	instance_count--;
}

SoftSingletonGuard::SoftSingletonGuard(SoftSingleton &t) :
	tracker(t) {
	tracker.increment();
}

SoftSingletonGuard::~SoftSingletonGuard() {
	tracker.decrement();
}
