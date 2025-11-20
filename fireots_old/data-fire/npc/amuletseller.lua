local internalNpcName = "Amuletseller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 39,
	lookBody = 77,
	lookLegs = 87,
	lookFeet = 58,
	lookAddons = 0,
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
	{ text = "Welcome to amulets shop!" },
}

npcConfig.flags = {
	floorchange = false,
}

local itemsTable = {
	["amulets"] = {
		{ itemName = "amulet of loss", clientId = 3057, sell = 200000 },
		{ itemName = "scarf", clientId = 3572, sell = 500, buy = 100, },
		{ itemName = "platinium amulet", clientId = 3055, sell = 6000, buy = 1000, },
		{ itemName = "dragon nackle", clientId = 3085, sell = 2500, buy = 500, },
		{ itemName = "stone skin amulet", clientId = 3081, sell = 15000, buy = 2500, },
		{ itemName = "terra amulet", clientId = 814, sell = 10000, buy = 1500, },
	},
}

npcConfig.shop = {}
for _, categoryTable in pairs(itemsTable) do
	for _, itemTable in ipairs(categoryTable) do
		table.insert(npcConfig.shop, itemTable)
	end
end

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- On creature say callback
local function creatureSayCallback(npc, player, type, msg)
	local playerId = player:getId()
	if not npcHandler:checkInteraction(npc, player) then
		return false
	end

	if MsgContains(msg, "amulet") then
		if npcHandler:getTopic(playerId) == 0 then
			npcHandler:say({
				"The goal is to buy any amulets? See more on our {aol}.",
			}, npc, player, 3000)
			npcHandler:setTopic(playerId, 1)
		end
	elseif MsgContains(msg, "aol") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("Take a look in my offer!", npc, player)
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(
	MESSAGE_GREET,
	"Oh, please come in, |PLAYERNAME| \z
	If you need magical equipment such as {amulets}, just ask me for a {trade}."
)
npcHandler:setMessage(
	MESSAGE_SENDTRADE,
	"Of course, just browse through my wares. \z
	Or do you want to look only at {amulets}?"
)
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

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

npcType:register(npcConfig)
