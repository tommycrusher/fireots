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

class Database;
class Logger;
class DBInsert;
class ValueWrapper;

class KVSQL final : public KVStore {
public:
	explicit KVSQL(Database &db, Logger &logger);

	bool saveAll() override;

private:
	std::vector<std::string> loadPrefix(const std::string &prefix = "") override;
	std::optional<ValueWrapper> load(const std::string &key) override;
	bool save(const std::string &key, const ValueWrapper &value) override;
	bool prepareSave(const std::string &key, const ValueWrapper &value, DBInsert &update) const;

	DBInsert dbUpdate();

	Database &db;
};
