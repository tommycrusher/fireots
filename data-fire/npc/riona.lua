local npcName = "Riona"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 10

npcConfig.outfit = {
	lookType = 138,
	lookHead = 57,
	lookBody = 59,
	lookLegs = 40,
	lookFeet = 76,
	lookAddons = 2,
	lookMount = 0,
}

npcConfig.sounds = {
	ticks = 5000,
	chance = 25,
	ids = {
		SOUND_EFFECT_TYPE_ACTION_HITING_FORGE,
		SOUND_EFFECT_TYPE_ACTION_WOOD_HIT,
		SOUND_EFFECT_TYPE_ACTION_CRATE_BREAK_MAGIC_DUST,
		SOUND_EFFECT_TYPE_ACTION_SWORD_DRAWN,
	},
}

npcConfig.voices = {
	interval = 15000,
	chance = 20,
	{ text = "Welcome to the equipment shop!" },
}

npcConfig.flags = {
	floorchange = false,
}

-- Npc shop
npcConfig.shop = {
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "bottle", clientId = 2875, buy = 3 },
	{ itemName = "bucket", clientId = 2873, buy = 4 },
	{ itemName = "candelabrum", clientId = 2911, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280, sell = 75 },
	{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
	{ itemName = "cup", clientId = 2881, buy = 2 },
	{ itemName = "document", clientId = 2818, buy = 12 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150, sell = 40 },
	{ itemName = "green backpack", clientId = 2865, buy = 20 },
	{ itemName = "green bag", clientId = 2857, buy = 4 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "machete", clientId = 3308, buy = 35, sell = 6 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "parchment", clientId = 2817, buy = 8 },
	{ itemName = "pick", clientId = 3456, buy = 50, sell = 15 },
	{ itemName = "plate", clientId = 2905, buy = 6 },
	{ itemName = "present", clientId = 2856, buy = 10 },
	{ itemName = "rope", clientId = 3003, buy = 50, sell = 15 },
	{ itemName = "scroll", clientId = 2815, buy = 5 },
	{ itemName = "scythe", clientId = 3453, buy = 50, sell = 10 },
	{ itemName = "shovel", clientId = 3457, buy = 50, sell = 8 },
	{ itemName = "torch", clientId = 2920, buy = 2 },
	{ itemName = "vial", clientId = 2874, sell = 5 },
	{ itemName = "vial of oil", clientId = 2874, buy = 20, count = 11 },
	{ itemName = "watch", clientId = 2906, buy = 20, sell = 6 },
	{ itemName = "waterskin of water", clientId = 2901, buy = 10, count = 1 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	{ itemName = "worm", clientId = 3492, buy = 1 },
}

-- Create keywordHandler and npcHandler
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

-- onThink
npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

-- onAppear
npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

-- onDisappear
npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

-- onMove
npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

-- onSay
npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

-- onPlayerCloseChannel
npcType.onCloseChannel = function(npc, player)
	npcHandler:onCloseChannel(npc, player)
end

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

-- Function called by the callback "npcHandler:setCallback(CALLBACK_GREET, greetCallback)" in end of file
local function greetCallback(npc, player)
	npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|, you need more info about {tools}?")
	return true
end

-- On creature say callback
local function creatureSayCallback(npc, player, type, msg)
	local playerId = player:getId()
	if not npcHandler:checkInteraction(npc, player) then
		return false
	end

	if MsgContains(msg, "tools") then
		if npcHandler:getTopic(playerId) == 0 then
			npcHandler:say({
				"The goal is better tools for us.",
			}, npc, player, 3000)
			npcHandler:setTopic(playerId, 1)
		end
	elseif MsgContains(msg, "equipment") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("See into my offer my friend!", npc, player)
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

-- Set to local function "greetCallback"
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
-- Set to local function "creatureSayCallback"
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-- Bye message
npcHandler:setMessage(MESSAGE_FAREWELL, "Yeah, good bye and don't come again!")
-- Walkaway message
npcHandler:setMessage(MESSAGE_WALKAWAY, "You not have education?")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- Register npc
npcType:register(npcConfig)
