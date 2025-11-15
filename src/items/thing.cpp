/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#include "pch.hpp"

#include "items/thing.hpp"
#include "items/tile.hpp"

const Position &Thing::getPosition() {
	std::shared_ptr<Tile> tile = getTile();
	if (!tile) {
		return Tile::nullptr_tile->getPosition();
	}
	return tile->getPosition();
}
