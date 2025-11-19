/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#include "items/item.hpp"

class House;
class Player;

class BedItem final : public Item {
public:
	explicit BedItem(uint16_t id);

	std::shared_ptr<BedItem> getBed() override {
		return static_self_cast<BedItem>();
	}

	Attr_ReadValue readAttr(AttrTypes_t attr, PropStream &propStream) override;
	void serializeAttr(PropWriteStream &propWriteStream) const override;

	bool canRemove() const override {
		return true;
	}

	uint32_t getSleeper() const {
		return sleeperGUID;
	}

	void setHouse(const std::shared_ptr<House> &h) {
		house = h;
	}

	bool canUse(const std::shared_ptr<Player> &player);

	bool isBedComplete(const std::shared_ptr<BedItem> &nextBedItem) const;

	bool trySleep(const std::shared_ptr<Player> &player);
	bool sleep(const std::shared_ptr<Player> &player);
	void wakeUp(const std::shared_ptr<Player> &player);

	std::shared_ptr<BedItem> getNextBedItem();

	friend class MapCache;

private:
	void updateAppearance(const std::shared_ptr<Player> &player);
	void regeneratePlayer(const std::shared_ptr<Player> &player) const;
	void internalSetSleeper(const std::shared_ptr<Player> &player);
	void internalRemoveSleeper();

	std::shared_ptr<House> house;
	uint64_t sleepStart {};
	uint32_t sleeperGUID {};
};
