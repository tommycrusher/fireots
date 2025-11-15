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
#include "lib/di/container.hpp"

class Familiars {
public:
	static Familiars &getInstance() {
		return inject<Familiars>();
	}
	bool loadFromXml();
	const std::vector<Familiar> &getFamiliars(uint16_t vocation) const {
		return familiars[vocation];
	}
	const Familiar* getFamiliarByLookType(uint16_t vocation, uint16_t lookType) const;

private:
	std::vector<Familiar> familiars[VOCATION_LAST + 1];
};
