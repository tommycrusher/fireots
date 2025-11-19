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

class WildcardTreeNode : public SharedObject {
public:
	explicit WildcardTreeNode(bool initBreakpoint) :
		breakpoint(initBreakpoint) { }
	WildcardTreeNode(WildcardTreeNode &&other) noexcept = default;

	// non-copyable
	WildcardTreeNode(const WildcardTreeNode &) = delete;
	WildcardTreeNode &operator=(const WildcardTreeNode &) = delete;

	std::shared_ptr<WildcardTreeNode> getChild(char ch);
	std::shared_ptr<WildcardTreeNode> getChild(char ch) const;
	std::shared_ptr<WildcardTreeNode> addChild(char ch, bool breakpoint);

	void insert(const std::string &str);
	void remove(const std::string &str);

	ReturnValue findOne(const std::string &query, std::string &result) const;

private:
	std::map<char, std::shared_ptr<WildcardTreeNode>> children;
	bool breakpoint;
};
