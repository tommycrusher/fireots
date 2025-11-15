/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

#include "kv/kv.hpp"

#include "database/database.hpp"
#include "lib/logging/logger.hpp"

class Database;

class KVSQL final : public KVStore {
public:
	explicit KVSQL(Database &db, Logger &logger) :
		KVStore(logger),
		db(db) { }

	bool saveAll() override;

private:
	std::vector<std::string> loadPrefix(const std::string &prefix = "") override;
	std::optional<ValueWrapper> load(const std::string &key) override;
	bool save(const std::string &key, const ValueWrapper &value) override;
	bool prepareSave(const std::string &key, const ValueWrapper &value, DBInsert &update);

	DBInsert dbUpdate() {
		auto insert = DBInsert("INSERT INTO `kv_store` (`key_name`, `timestamp`, `value`) VALUES");
		insert.upsert({ "key_name", "timestamp", "value" });
		return insert;
	}

	Database &db;
};
