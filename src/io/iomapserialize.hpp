/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#include "map/map.hpp"

class IOMapSerialize {
public:
	static void loadHouseItems(Map* map);
	static bool saveHouseItems();
	static bool loadHouseInfo();
	static bool saveHouseInfo();

private:
	static bool SaveHouseInfoGuard();
	static bool SaveHouseItemsGuard();
	static void saveItem(PropWriteStream &stream, std::shared_ptr<Item> item);
	static void saveTile(PropWriteStream &stream, std::shared_ptr<Tile> tile);

	static bool loadContainer(PropStream &propStream, std::shared_ptr<Container> container);
	static bool loadItem(PropStream &propStream, std::shared_ptr<Cylinder> parent, bool isHouseItem = false);
};
