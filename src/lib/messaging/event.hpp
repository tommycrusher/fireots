/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */
#pragma once

enum class EventType {
};

using IEvent = Message<EventType>;
using EventHandler = MessageHandler<EventType>;
using EventPolicy = MessagePolicy<EventType>;
using EventListener = IMessageListener<EventType>;
using EventListeners = MessageListeners<EventType>;
using EventDispatcher = MessageDispatcher<EventType>;
using EventRemover = MessageRemover<EventType>;

inline IEvent event(EventType type) {
	return IEvent { type };
}
#define eventCallback(block) [this](const IEvent &) block
#define appendEventListener(type, block) dispatcher.appendListener(type, eventCallback(block))
