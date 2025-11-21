local internalNpcName = "Dark Rodo"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 133,
	lookHead = 0,
	lookBody = 86,
	lookLegs = 0,
	lookFeet = 38,
	lookAddons = 1,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Check out my magic offer!" },
}
local itemsTable = {
	["potions"] = {
		{ itemName = "empty potion flask", clientId = 283, sell = 5, buy = 10 },
		{ itemName = "empty potion flask", clientId = 284, sell = 5, buy = 15 },
		{ itemName = "empty potion flask", clientId = 285, sell = 5, buy = 20 },
		{ itemName = "great health potion", clientId = 239, buy = 225 },
		{ itemName = "great mana potion", clientId = 238, buy = 144 },----
		{ itemName = "great spirit potion", clientId = 7642, buy = 228 },--
		{ itemName = "health potion", clientId = 266, buy = 50 },--
		{ itemName = "mana potion", clientId = 268, buy = 56 },--
		{ itemName = "strong health potion", clientId = 236, buy = 115 },--
		{ itemName = "strong mana potion", clientId = 237, buy = 93 },
		{ itemName = "ultimate health potion", clientId = 7643, buy = 379 },
		{ itemName = "vial", clientId = 2874, sell = 5 },
		{ itemName = "small health", clientId = 7876, buy = 20, sell = 1 },
		{ itemName = "ultimate health", clientId = 7643, buy = 310, sell = 21 },
		{ itemName = "antidote potion", clientId = 7644, buy = 50, sell = 11 },
		{ itemName = "ultimate mana potion", clientId = 23373, buy = 250, sell = 10 },
		{ itemName = "ultimate spirit potion", clientId = 23374, buy = 250, sell = 10 },
		{ itemName = "supreme health potion", clientId = 23375, buy = 500, sell = 51 },
	},
	["runes"] = {
		{ itemName = "avalanche rune", clientId = 3161, buy = 57 },
		{ itemName = "blank rune", clientId = 3147, buy = 10 },
		{ itemName = "chameleon rune", clientId = 3178, buy = 210 },
		{ itemName = "convince creature rune", clientId = 3177, buy = 80 },
		{ itemName = "cure poison rune", clientId = 3153, buy = 65 },
		{ itemName = "destroy field rune", clientId = 3148, buy = 15 },
		{ itemName = "energy field rune", clientId = 3164, buy = 38 },
		{ itemName = "energy wall rune", clientId = 3166, buy = 85 },
		{ itemName = "explosion rune", clientId = 3200, buy = 31 },
		{ itemName = "fire bomb rune", clientId = 3192, buy = 147 },
		{ itemName = "fire field rune", clientId = 3188, buy = 28 },
		{ itemName = "fire wall rune", clientId = 3190, buy = 61 },
		{ itemName = "great fireball rune", clientId = 3191, buy = 57 },
		{ itemName = "heavy magic missile rune", clientId = 3198, buy = 12 },
		{ itemName = "intense healing rune", clientId = 3152, buy = 95 },
		{ itemName = "light magic missile rune", clientId = 3174, buy = 4 },
		{ itemName = "poison field rune", clientId = 3172, buy = 21 },
		{ itemName = "poison wall rune", clientId = 3176, buy = 52 },
		{ itemName = "stalagmite rune", clientId = 3179, buy = 12 },
		{ itemName = "sudden death rune", clientId = 3155, buy = 135 },
		{ itemName = "ultimate healing rune", clientId = 3160, buy = 175 },
		{ itemName = "super mana rune", clientId = 3185, buy = 95000, sell = 100 },
		{ itemName = "mana rune", clientId = 3157, buy = 45000, sell = 100 },
		{ itemName = "magic wall", clientId = 3180, buy = 350, sell = 3 },
		--{ itemName = "dead arrow", clientId = 2263, buy = 300, sell = 3 },
		{ itemName = "paralyse rune", clientId = 3165, buy = 700, sell = 1 },
		{ itemName = "animate dead", clientId = 3203, buy = 375, sell = 1 },
		{ itemName = "disintegrate", clientId = 3197, buy = 80, sell = 3 },
	},
	["wands"] = {
		{ itemName = "moonlight rod", clientId = 3070, buy = 1000, sell = 500 },
		{ itemName = "necrotic rod", clientId = 3069, buy = 5000, sell = 2500 },
		{ itemName = "snakebite rod", clientId = 3066, buy = 500, sell = 250 },
		{ itemName = "springsprout rod", clientId = 8084, buy = 18000, sell = 9000 },
		{ itemName = "terra rod", clientId = 3065, buy = 10000, sell = 5000 },
		{ itemName = "wand of cosmic energy", clientId = 3073, buy = 10000, sell = 5000 },
		{ itemName = "wand of decay", clientId = 3072, buy = 5000, sell = 2500 },
		{ itemName = "wand of dragonbreath", clientId = 3075, buy = 1000, sell = 500 },
		{ itemName = "wand of vortex", clientId = 3074, buy = 500, sell = 250 },
		{ itemName = "wand of draconia", clientId = 8093, buy = 7500, sell = 3750 },
		{ itemName = "wand of cosmic energy", clientId = 3073, buy = 10000 },
		{ itemName = "wand of inferno", clientId = 3071, buy = 15000, sell = 7500 },
		{ itemName = "wand of starstorm", clientId = 8092, buy = 18000, sell = 9000 },
		{ itemName = "wand of voodoo", clientId = 8094, buy = 22000, sell = 11000 },

		{ itemName = "northwind rod", clientId = 8083, buy = 7500, sell = 3750 },
		{ itemName = "hailstorm rod", clientId = 3067, buy = 15000, sell = 7500 },
		{ itemName = "underworld rod", clientId = 8082, buy = 22000, sell = 11000 },
	},
	["others"] = {
		{ itemName = "spellbook", clientId = 3101, buy = 150 },
		{ itemName = "magic light wand", clientId = 3046, buy = 400 },

		--{ itemName = "bp ap", containerId = 2002, clientId = 8378, buy = 2000, sell = 1 },
		--{ itemName = "bp slhp", containerId = 2000, clientId = 8610, buy = 400, sell = 1 },
		--{ itemName = "bp hp", containerId = 2000, clientId = 7618, buy = 900, sell = 1 },
		--{ itemName = "bp mp", containerId = 2001, clientId = 7620, buy = 1000, sell = 1 },
		--{ itemName = "bp shp", containerId = 2000, clientId = 7588, buy = 2000, sell = 1 },
		--{ itemName = "bp smp", containerId = 2001, clientId = 7589, buy = 1600, sell = 1 },
		--{ itemName = "bp ghp", containerId = 2000, clientId = 7591, buy = 3800, sell = 1 },
		--{ itemName = "bp gmp", containerId = 2001, clientId = 7590, buy = 2400, sell = 1 },
		--{ itemName = "bp gsp", containerId = 1999, clientId = 8376, buy = 3800, sell = 1 },
		--{ itemName = "bp uhp", containerId = 2000, clientId = 8377, buy = 6200, sell = 1 },
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

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
local items = {
	[VOCATION.BASE_ID.SORCERER] = 3074,
	[VOCATION.BASE_ID.DRUID] = 3066,
}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local formattedCategoryNames = {}
	for categoryName, _ in pairs(itemsTable) do
		table.insert(formattedCategoryNames, "{" .. categoryName .. "}")
	end

	local categoryTable = itemsTable[message:lower()]
	local itemId = items[player:getVocation():getBaseId()]
	if MsgContains(message, "first rod") or MsgContains(message, "first wand") then
		if player:isMage() then
			if player:getStorageValue(Storage.FirstMageWeapon) == -1 then
				npcHandler:say("So you ask me for a {" .. ItemType(itemId):getName() .. "} to begin your adventure?", npc, creature)
				npcHandler:setTopic(playerId, 1)
			else
				npcHandler:say("What? I have already gave you one {" .. ItemType(itemId):getName() .. "}!", npc, creature)
			end
		else
			npcHandler:say("Sorry, you aren't a druid either a sorcerer.", npc, creature)
		end
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			player:addItem(itemId, 1)
			npcHandler:say("Here you are young adept, take care yourself.", npc, creature)
			player:setStorageValue(Storage.FirstMageWeapon, 1)
		end
		npcHandler:setTopic(playerId, 0)
	elseif MsgContains(message, "no") and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("Ok then.", npc, creature)
		npcHandler:setTopic(playerId, 0)
	elseif categoryTable then
		npcHandler:say("Of course, just browse through my wares.", npc, player)
		npc:openShopWindowTable(player, categoryTable)
	elseif isInArray({"vial", "ticket", "bonus"}, message) and npcHandler:getTopic(playerId) == 1 then
		if player:removeItem(283, 10000) or player:removeItem(284, 10000) or player:removeItem(285, 10000) then
			player:addItem(5957, 1)
			npcHandler:say("Alright, thank you very much! Here is your lottery ticket, good luck. Would you like to deposit more vials that way?", npc, player)
			npcHandler:setTopic(playerId, 0)
		else
			npcHandler:say("Sorry, but you don't have 10000 empty flasks or vials of the SAME kind and thus don't qualify for the lottery. Would you like to deposit the vials you have as usual and receive 5 gold per vial?", npc, player)
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(
	MESSAGE_GREET,
	"Oh, please come in, |PLAYERNAME| \z
	If you need magical equipment such as {runes} or {wands}, just ask me for a {trade}."
)
npcHandler:setMessage(
	MESSAGE_SENDTRADE,
	"Of course, just browse through my wares. \z
	Or do you want to look only at {potions}, {wands} or {runes}?"
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
