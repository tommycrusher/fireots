/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */

#pragma once

class Logger;

class RSA {
public:
	RSA(Logger &logger);
	~RSA();

	// Singleton - ensures we don't accidentally copy it
	RSA(RSA const &) = delete;
	void operator=(RSA const &) = delete;

	static RSA &getInstance();

	void start();

	void setKey(const char* pString, const char* qString, int base = 10);
	void decrypt(char* msg) const;

	std::string base64Decrypt(const std::string &input) const;
	uint16_t decodeLength(char*&pos) const;
	void readHexString(char*&pos, uint16_t length, std::string &output) const;
	bool loadPEM(const std::string &filename);

private:
	Logger &logger;
	mpz_t n;
	mpz_t d;
};

constexpr auto g_RSA = RSA::getInstance;
