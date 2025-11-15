/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */
#pragma once

enum class CommandType {
	start,
	load,
	run,
	shutdown,
};

using ICommand = Message<CommandType>;
using CommandHandler = MessageHandler<CommandType>;
using CommandPolicy = MessagePolicy<CommandType>;
using CommandListener = IMessageListener<CommandType>;
using CommandListeners = MessageListeners<CommandType>;
using CommandDispatcher = MessageDispatcher<CommandType>;
using CommandRemover = MessageRemover<CommandType>;

inline ICommand command(CommandType type) {
	return ICommand { type };
}
#define commandCallback(block) [this](const ICommand &) block
#define appendCommandListener(type, block) dispatcher.appendListener(type, commandCallback(block))
