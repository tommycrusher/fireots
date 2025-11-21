local internalNpcName = "GM Rare"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 300,
	lookHead = 79,
	lookBody = 115,
	lookLegs = 78,
	lookFeet = 115,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Welcome everyone traveler to my GM Shop!" },
}

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

-- Twist of Fate
local blessKeyword = keywordHandler:addKeyword({ "twist of fate" }, StdModule.say, {
	npcHandler = npcHandler,
	text = {
		"This is a special blessing I can bestow upon you once you have obtained at least one of the other blessings and which functions a bit differently. ...",
		"It only works when you're killed by other adventurers, which means that at least half of the damage leading to your death was caused by others, not by monsters or the environment. ...",
		"The {twist of fate} will not reduce the death penalty like the other blessings, but instead prevent you from losing your other blessings as well as the amulet of loss, should you wear one. It costs the same as the other blessings. ...",
		"Would you like to receive that protection for a sacrifice of |PVPBLESSCOST| gold, child?",
	},
})
blessKeyword:addChildKeyword({ "yes" }, StdModule.bless, { npcHandler = npcHandler, text = "So receive the protection of the twist of fate, pilgrim.", cost = "|PVPBLESSCOST|", bless = 1 })
blessKeyword:addChildKeyword({ "" }, StdModule.say, { npcHandler = npcHandler, text = "Fine. You are free to decline my offer.", reset = true })

-- Adventurer Stone
keywordHandler:addKeyword({ "adventurer stone" }, StdModule.say, { npcHandler = npcHandler, text = "Keep your adventurer's stone well." }, function(player)
	return player:getItemById(16277, true)
end)

local stoneKeyword = keywordHandler:addKeyword({ "adventurer stone" }, StdModule.say, { npcHandler = npcHandler, text = "Ah, you want to replace your adventurer's stone for free?" }, function(player)
	return player:getStorageValue(Storage.AdventurersGuild.FreeStone.Alia) ~= 1
end)
stoneKeyword:addChildKeyword({ "yes" }, StdModule.say, { npcHandler = npcHandler, text = "Here you are. Take care.", reset = true }, nil, function(player)
	player:addItem(16277, 1)
	player:setStorageValue(Storage.AdventurersGuild.FreeStone.Alia, 1)
end)
stoneKeyword:addChildKeyword({ "" }, StdModule.say, { npcHandler = npcHandler, text = "No problem.", reset = true })

local stoneKeyword = keywordHandler:addKeyword({ "adventurer stone" }, StdModule.say, { npcHandler = npcHandler, text = "Ah, you want to replace your adventurer's stone for 30 gold?" })
stoneKeyword:addChildKeyword({ "yes" }, StdModule.say, { npcHandler = npcHandler, text = "Here you are. Take care.", reset = true }, function(player)
	return player:getMoney() + player:getBankBalance() >= 30
end, function(player)
	if player:removeMoneyBank(30) then
		player:addItem(16277, 1)
	end
end)
stoneKeyword:addChildKeyword({ "yes" }, StdModule.say, { npcHandler = npcHandler, text = "Sorry, you don't have enough money.", reset = true })
stoneKeyword:addChildKeyword({ "" }, StdModule.say, { npcHandler = npcHandler, text = "No problem.", reset = true })

-- Healing
local function addHealKeyword(text, condition, effect)
	keywordHandler:addKeyword({ "heal" }, StdModule.say, { npcHandler = npcHandler, text = text }, function(player)
		return player:getCondition(condition) ~= nil
	end, function(player)
		player:removeCondition(condition)
		player:getPosition():sendMagicEffect(effect)
	end)
end

addHealKeyword("You are burning. Let me quench those flames.", CONDITION_FIRE, CONST_ME_MAGIC_GREEN)
addHealKeyword("You are poisoned. Let me soothe your pain.", CONDITION_POISON, CONST_ME_MAGIC_RED)
addHealKeyword("You are electrified, my child. Let me help you to stop trembling.", CONDITION_ENERGY, CONST_ME_MAGIC_GREEN)

keywordHandler:addKeyword({ "heal" }, StdModule.say, { npcHandler = npcHandler, text = "You are hurt, my child. I will heal your wounds." }, function(player)
	return player:getHealth() < 40
end, function(player)
	local health = player:getHealth()
	if health < 40 then
		player:addHealth(40 - health)
	end
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
end)
keywordHandler:addKeyword({ "heal" }, StdModule.say, { npcHandler = npcHandler, text = "You aren't looking that bad. Sorry, I can't help you. But if you are looking for additional protection you should go on the {pilgrimage} of ashes or get the protection of the {twist of fate} here." })

-- Basic
keywordHandler:addKeyword({ "pilgrimage" }, StdModule.say, { npcHandler = npcHandler, text = "Whenever you receive a lethal wound, your vital force is damaged and there is a chance that you lose some of your equipment. With every single of the five {blessings} you have, this damage and chance of loss will be reduced." })
keywordHandler:addKeyword({ "blessings" }, StdModule.say, { npcHandler = npcHandler, text = "There are five blessings available in five sacred places: the {spiritual} shielding, the spark of the {phoenix}, the {embrace} of Tibia, the fire of the {suns} and the wisdom of {solitude}. Additionally, you can receive the {twist of fate} here." })
keywordHandler:addKeyword({ "spiritual" }, StdModule.say, { npcHandler = npcHandler, text = "I see you received the spiritual shielding in the whiteflower temple south of Thais." }, function(player)
	return player:hasBlessing(1)
end)
keywordHandler:addAliasKeyword({ "shield" })
keywordHandler:addKeyword({ "embrace" }, StdModule.say, { npcHandler = npcHandler, text = "I can sense that the druids north of Carlin have provided you with the Embrace of Tibia." }, function(player)
	return player:hasBlessing(2)
end)
keywordHandler:addKeyword({ "suns" }, StdModule.say, { npcHandler = npcHandler, text = "I can see you received the blessing of the two suns in the suntower near Ab'Dendriel." }, function(player)
	return player:hasBlessing(3)
end)
keywordHandler:addAliasKeyword({ "fire" })
keywordHandler:addKeyword({ "phoenix" }, StdModule.say, { npcHandler = npcHandler, text = "I can sense that the spark of the phoenix already was given to you by the dwarven priests of earth and fire in Kazordoon." }, function(player)
	return player:hasBlessing(4)
end)
keywordHandler:addAliasKeyword({ "spark" })
keywordHandler:addKeyword({ "solitude" }, StdModule.say, { npcHandler = npcHandler, text = "I can sense you already talked to the hermit Eremo on the isle of Cormaya and received this blessing." }, function(player)
	return player:hasBlessing(5)
end)
keywordHandler:addAliasKeyword({ "wisdom" })
keywordHandler:addKeyword({ "spiritual" }, StdModule.say, { npcHandler = npcHandler, text = "You can ask for the blessing of spiritual shielding in the whiteflower temple south of Thais." })
keywordHandler:addAliasKeyword({ "shield" })
keywordHandler:addKeyword({ "embrace" }, StdModule.say, { npcHandler = npcHandler, text = "The druids north of Carlin will provide you with the embrace of Tibia." })
keywordHandler:addKeyword({ "suns" }, StdModule.say, { npcHandler = npcHandler, text = "You can ask for the blessing of the two suns in the suntower near Ab'Dendriel." })
keywordHandler:addAliasKeyword({ "fire" })
keywordHandler:addKeyword({ "phoenix" }, StdModule.say, { npcHandler = npcHandler, text = "The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon." })
keywordHandler:addAliasKeyword({ "spark" })
keywordHandler:addKeyword({ "solitude" }, StdModule.say, { npcHandler = npcHandler, text = "Talk to the hermit Eremo on the isle of Cormaya about this blessing." })
keywordHandler:addAliasKeyword({ "wisdom" })

npcHandler:setMessage(MESSAGE_GREET, "Welcome, young |PLAYERNAME|! If you are heavily wounded or poisoned, I can {heal} you for free.\z
	If anyway you need equipment such as {swords}, {axes}, {clubs}, {shields}, {armors}, {legs}, {boots} or {others} just ask me for a {trade}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Remember: If you are heavily wounded or poisoned, I can heal you for free.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May the gods bless you, |PLAYERNAME|!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

local itemsTable = {
	["others"] = {
		{ itemName = "arrow", clientId = 3447, buy = 3 },
		{ itemName = "sniper glowes", clientId = 5875, buy = 100000 },
		{ itemName = "lizard leather", clientId = 5876, buy = 10000 },
		{ itemName = "green dragon leather", clientId = 5877, buy = 10000 },
		{ itemName = "minotaur leather", clientId = 5878, buy = 10000 },
		{ itemName = "spider silk", clientId = 5879, buy = 10000 },
		{ itemName = "iron ore", clientId = 5880, buy = 10000 },
		{ itemName = "lizard scale", clientId = 5881, buy = 10000 },
		{ itemName = "red dragon scale", clientId = 5882, buy = 10000 },
		{ itemName = "ape fur", clientId = 5883, buy = 10000 },
		{ itemName = "chicken feather", clientId = 5890, buy = 10000 },
		{ itemName = "enchanted chicken wing", clientId = 5891, buy = 10000 },
		{ itemName = "perfect bohemoth fang", clientId = 5893, buy = 100000 },
		{ itemName = "bat wing", clientId = 5894, buy = 10000 },
		{ itemName = "fish fin", clientId = 5895, buy = 10000 },
		{ itemName = "bear paw", clientId = 5896, buy = 10000 },
		{ itemName = "wolf paw", clientId = 5897, buy = 10000 },
		{ itemName = "battle hammer", clientId = 3305, buy = 350, sell = 120 },
		{ itemName = "battle shield", clientId = 3413, sell = 95 },
		{ itemName = "blue quiver", clientId = 35848, buy = 400 },
		{ itemName = "bolt", clientId = 3446, buy = 4 },
		{ itemName = "bone club", clientId = 3337, sell = 5 },
		{ itemName = "bone sword", clientId = 3338, buy = 75, sell = 20 },
		{ itemName = "bow", clientId = 3350, buy = 400, sell = 100 },
		{ itemName = "brass armor", clientId = 3359, buy = 450, sell = 150 },
		{ itemName = "brass helmet", clientId = 3354, buy = 120, sell = 30 },
		{ itemName = "brass legs", clientId = 3372, buy = 195, sell = 49 },
		{ itemName = "brass shield", clientId = 3411, buy = 65, sell = 25 },
		{ itemName = "carlin sword", clientId = 3283, buy = 473, sell = 118 },
		{ itemName = "chain armor", clientId = 3358, buy = 200, sell = 70 },
		{ itemName = "chain helmet", clientId = 3352, buy = 52, sell = 17 },
		{ itemName = "chain legs", clientId = 3558, buy = 80, sell = 25 },
		{ itemName = "clerical mace", clientId = 3311, sell = 170 },
		{ itemName = "club", clientId = 3270, buy = 5, sell = 1 },
		{ itemName = "coat", clientId = 3562, buy = 8, sell = 1 },
		{ itemName = "copper shield", clientId = 3430, sell = 50 },
		{ itemName = "crossbow", clientId = 3349, buy = 500, sell = 120 },
		{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
		{ itemName = "crystalline arrow", clientId = 15793, buy = 20 },
		{ itemName = "dagger", clientId = 3267, buy = 5, sell = 2 },
		{ itemName = "diamond arrow", clientId = 35901, buy = 100 },
		{ itemName = "double axe", clientId = 3275, sell = 260 },
		{ itemName = "doublet", clientId = 3379, buy = 16, sell = 3 },
		{ itemName = "drill bolt", clientId = 16142, buy = 12 },
		{ itemName = "durable exercise axe", clientId = 35280, buy = 945000, count = 1800 },
		{ itemName = "durable exercise bow", clientId = 35282, buy = 945000, count = 1800 },
		{ itemName = "durable exercise club", clientId = 35281, buy = 945000, count = 1800 },
		{ itemName = "durable exercise shield", clientId = 44066, buy = 945000, count = 1800 },
		{ itemName = "durable exercise sword", clientId = 35279, buy = 945000, count = 1800 },
		{ itemName = "dwarven shield", clientId = 3425, buy = 500, sell = 100 },
		{ itemName = "earth arrow", clientId = 774, buy = 5 },
		{ itemName = "envenomed arrow", clientId = 16143, buy = 12 },
		{ itemName = "exercise axe", clientId = 28553, buy = 262500, count = 500 },
		{ itemName = "exercise bow", clientId = 28555, buy = 262500, count = 500 },
		{ itemName = "exercise club", clientId = 28554, buy = 262500, count = 500 },
		{ itemName = "exercise shield", clientId = 44065, buy = 262500, count = 500 },
		{ itemName = "exercise sword", clientId = 28552, buy = 262500, count = 500 },
		{ itemName = "fire sword", clientId = 3280, sell = 1000 },
		{ itemName = "flaming arrow", clientId = 763, buy = 5 },
		{ itemName = "flash arrow", clientId = 761, buy = 5 },
		{ itemName = "halberd", clientId = 3269, sell = 400 },
		{ itemName = "hand axe", clientId = 3268, buy = 8, sell = 4 },
		{ itemName = "hatchet", clientId = 3276, sell = 25 },
		{ itemName = "iron helmet", clientId = 3353, buy = 390, sell = 150 },
		{ itemName = "jacket", clientId = 3561, buy = 12, sell = 1 },
		{ itemName = "katana", clientId = 3300, sell = 35 },
		{ itemName = "lasting exercise axe", clientId = 35286, buy = 7560000, count = 14400 },
		{ itemName = "lasting exercise bow", clientId = 35288, buy = 7560000, count = 14400 },
		{ itemName = "lasting exercise club", clientId = 35287, buy = 7560000, count = 14400 },
		{ itemName = "lasting exercise shield", clientId = 44067, buy = 7560000, count = 14400 },
		{ itemName = "lasting exercise sword", clientId = 35285, buy = 7560000, count = 14400 },
		{ itemName = "leather armor", clientId = 3361, buy = 35, sell = 12 },
		{ itemName = "leather boots", clientId = 3552, buy = 10, sell = 2 },
		{ itemName = "leather helmet", clientId = 3355, buy = 12, sell = 4 },
		{ itemName = "leather legs", clientId = 3559, buy = 10, sell = 9 },
		{ itemName = "legion helmet", clientId = 3374, sell = 22 },
		{ itemName = "longsword", clientId = 3285, buy = 160, sell = 51 },
		{ itemName = "mace", clientId = 3286, buy = 90, sell = 30 },
		{ itemName = "morning star", clientId = 3282, buy = 430, sell = 100 },
		{ itemName = "onyx arrow", clientId = 7365, buy = 7 },
		{ itemName = "orcish axe", clientId = 3316, sell = 350 },
		{ itemName = "piercing bolt", clientId = 7363, buy = 5 },
		{ itemName = "plate armor", clientId = 3357, buy = 1200, sell = 400 },
		{ itemName = "plate legs", clientId = 3557, sell = 115 },
		{ itemName = "plate shield", clientId = 3410, buy = 125, sell = 45 },
		{ itemName = "power bolt", clientId = 3450, buy = 7 },
		{ itemName = "prismatic bolt", clientId = 16141, buy = 20 },
		{ itemName = "quiver", clientId = 35562, buy = 400 },
		{ itemName = "rapier", clientId = 3272, buy = 15 },
		{ itemName = "red quiver", clientId = 35849, buy = 400 },
		{ itemName = "royal spear", clientId = 7378, buy = 15 },
		{ itemName = "sabre", clientId = 3273, buy = 35 },
		{ itemName = "scale armor", clientId = 3377, buy = 260, sell = 100 },
		{ itemName = "shiver arrow", clientId = 762, buy = 5 },
		{ itemName = "short sword", clientId = 3294, buy = 26 },
		{ itemName = "sickle", clientId = 3293, buy = 7 },
		{ itemName = "sniper arrow", clientId = 7364, buy = 5 },
		{ itemName = "soldier helmet", clientId = 3375, buy = 110 },
		{ itemName = "spear", clientId = 3277, buy = 9 },
		{ itemName = "spectral bolt", clientId = 35902, buy = 70 },
		{ itemName = "spike sword", clientId = 3271, buy = 8000 },
		{ itemName = "steel helmet", clientId = 3351, buy = 580 },
		{ itemName = "steel shield", clientId = 3409, buy = 240 },
		{ itemName = "studded armor", clientId = 3378, buy = 90 },
		{ itemName = "studded helmet", clientId = 3376, buy = 63 },
		{ itemName = "studded legs", clientId = 3362, buy = 50 },
		{ itemName = "studded shield", clientId = 3426, buy = 50 },
		{ itemName = "sword", clientId = 3264, buy = 85 },
		{ itemName = "tarsal arrow", clientId = 14251, buy = 6 },
		{ itemName = "throwing knife", clientId = 3298, buy = 25 },
		{ itemName = "throwing star", clientId = 3287, buy = 42 },
		{ itemName = "two handed sword", clientId = 3265, buy = 950, sell = 400 },
		{ itemName = "viking helmet", clientId = 3367, buy = 265 },
		{ itemName = "viking shield", clientId = 3431, buy = 260 },
		{ itemName = "vortex bolt", clientId = 14252, buy = 6 },
		{ itemName = "war hammer", clientId = 3279, buy = 10000 },
		{ itemName = "wooden shield", clientId = 3412, buy = 15 },
		{ itemName = 'wand of inferno', clientId = 3071, sell = 3000 },
		{ itemName = 'wand of cosmic energy', clientId = 3073, sell = 2000 },
	},
	["swords"] = {
		{ itemName = 'broadsword', clientId = 3301, sell = 150 },
		{ itemName = 'jagged sword', clientId = 7774, sell = 200 },
		{ itemName = 'serpent sword', clientId = 3297, sell = 700 },
		{ itemName = 'crimson sword', clientId = 7385, sell = 600 },
		{ itemName = 'wyvern fang', clientId = 7408, sell = 2500 },
		{ itemName = 'crystal sword', clientId = 7449, sell = 5000 },
		{ itemName = 'bright sword', clientId = 3295, sell = 10000 },
		{ itemName = 'epee', clientId = 3326, sell = 15000 },
		{ itemName = 'djinn blade', clientId = 3339, sell = 25000 },
		{ itemName = 'assassin dagger', clientId = 7404, sell = 25000 },
		{ itemName = 'haunted blade', clientId = 7407, sell = 35000 },
		{ itemName = 'pharaoh sword', clientId = 3334, sell = 40000 },
		{ itemName = 'blacksteel sword', clientId = 7406, sell = 5000 },
		{ itemName = 'ice rapier', clientId = 3284, sell = 1000 },
		{ itemName = 'relic sword', clientId = 7383, sell = 25000 },
		{ itemName = 'bloody edge', clientId = 7416, sell = 50000 },
		{ itemName = 'mercenary sword', clientId = 7386, sell = 25000 },
		{ itemName = 'dragon slayer', clientId = 7402, sell = 14000 },
		{ itemName = 'mystic blade', clientId = 7384, sell = 20000 },
		{ itemName = 'thaian sword', clientId = 7391, sell = 20000 },
		{ itemName = 'giant sword', clientId = 3281, sell = 17000 },
		{ itemName = 'nightmare blade', clientId = 7418, sell = 35000 },
		{ itemName = 'demonrage sword', clientId = 7382, sell = 21000 },
		{ itemName = 'justice seeker', clientId = 7390, sell = 60000 },
		{ itemName = 'magic sword', clientId = 3288, sell = 650000 },
		{ itemName = 'emerald sword', clientId = 8102, sell = 450000 },
		{ itemName = 'avenger', clientId = 6527, sell = 200000 },
		{ itemName = 'warlord sword', clientId = 3296, sell = 700000 },
		{ itemName = 'magic longsword', clientId = 3278, sell = 230000 },
		{ itemName = 'berserker', clientId = 7403, sell = 40000 },
	},
	["axes"] = {
		{ itemName = "axe", clientId = 3274, buy = 20, sell = 7 },
		{ itemName = "battle axe", clientId = 3266, buy = 235, sell = 80 },
		{ itemName = 'steel axe', clientId = 7773, sell = 300 },
		{ itemName = 'barbarian axe', clientId = 3317, sell = 150 },
		{ itemName = 'knight axe', clientId = 3318, sell = 2000 },
		{ itemName = 'fire axe', clientId = 3320, sell = 9000 },
		{ itemName = 'ripper lance', clientId = 3346, sell = 500 },
		{ itemName = 'dwarven axe', clientId = 3323, sell = 1500 },
		{ itemName = 'obsidian lance', clientId = 3313, sell = 400 },
		{ itemName = 'beastslayer axe', clientId = 3344, sell = 2000 },
		{ itemName = 'daramian waraxe', clientId = 3328, sell = 1000 },
		{ itemName = 'naginata', clientId = 3314, sell = 50 },
		{ itemName = 'noble axe', clientId = 7456, sell = 9000 },
		{ itemName = 'dreaded cleaver', clientId = 7419, sell = 35000 },
		{ itemName = 'headchopper', clientId = 7380, sell = 4000 },
		{ itemName = 'ornamented axe', clientId = 7411, sell = 20000 },
		{ itemName = 'titan axe', clientId = 7413, sell = 100000 },
		{ itemName = 'vile axe', clientId = 7388, sell = 200000 },
		{ itemName = 'heroic axe', clientId = 7389, sell = 10000 },
		{ itemName = 'twin axe', clientId = 3335, sell = 25000 },
		{ itemName = 'guardian halberd', clientId = 3315, sell = 13000 },
		{ itemName = "reaper's axe", clientId = 7420, sell = 35000 },
		{ itemName = 'dragon lance', clientId = 3302, sell = 16000 },
		{ itemName = 'royal axe', clientId = 7434, sell = 60000 },
		{ itemName = 'war axe', clientId = 3342, sell = 9000 },
		{ itemName = "revager's axe", clientId = 3331, sell = 50000 },
		{ itemName = 'ruthless axe', clientId = 6553, sell = 350000 },
		{ itemName = 'stonecutter axe', clientId = 3319, sell = 650000 },
		{ itemName = 'hellforged axe', clientId = 8096, sell = 850000 },
		{ itemName = 'great axe', clientId = 3303, sell = 140000 },
		{ itemName = 'solar axe', clientId = 8097, sell = 1600000 },
		{ itemName = 'demonwing axe', clientId = 8098, sell = 150000 },
	},
	["clubs"] = {
		{ itemName = 'daramian mace', clientId = 3327, sell = 200 },
		{ itemName = 'banana staff', clientId = 3348, sell = 1000 },
		{ itemName = 'mammoth whopper', clientId = 7381, sell = 300 },
		{ itemName = 'taurus mace', clientId = 7425, sell = 500 },
		{ itemName = 'furry club', clientId = 7432, sell = 1500 },
		{ itemName = 'dragon hammer', clientId = 3322, sell = 2000 },
		{ itemName = 'dragonbone staff', clientId = 7430, sell = 4000 },
		{ itemName = "brutetamer's staff", clientId = 7379, sell = 1500 },
		{ itemName = 'diamond sceptre', clientId = 7387, sell = 3000 },
		{ itemName = 'skull staff', clientId = 3324, sell = 6000 },
		{ itemName = 'sapphire hammer', clientId = 7437, sell = 7000 },
		{ itemName = 'crystal mace', clientId = 3333, sell = 70000 },
		{ itemName = 'shadow sceptre', clientId = 7451, sell = 150000 },
		{ itemName = 'lich staff', clientId = 3334, sell = 60000 },
		{ itemName = 'lunar staff', clientId = 7424, sell = 5000 },
		{ itemName = 'silver mace', clientId = 3312, sell = 250 },
		{ itemName = 'spiked squelcher', clientId = 7452, sell = 4000 },
		{ itemName = 'orcish maul', clientId = 7392, sell = 4000 },
		{ itemName = 'amber staff', clientId = 7426, sell = 9000 },
		{ itemName = "queen's sceptre", clientId = 7410, sell = 25000 },
		{ itemName = 'chaos mace', clientId = 7427, sell = 15000 },
		{ itemName = 'cranial basher', clientId = 7415, sell = 5000 },
		{ itemName = 'onyx flail', clientId = 7421, sell = 120000 },
		{ itemName = 'war hammer', clientId = 3279, sell = 1500 },
		{ itemName = 'abyss hammer', clientId = 7414, sell = 130000 },
		{ itemName = 'blessed sceptre', clientId = 7429, sell = 170000 },
		{ itemName = 'demonbone', clientId = 7431, sell = 250000 },
		{ itemName = 'hammer of wrath', clientId = 3332, sell = 350000 },
		{ itemName = 'heavy mace', clientId = 3340, sell = 390000 },
		{ itemName = 'obsidian truncheon', clientId = 8100, sell = 120000, buy = 950000 },
		{ itemName = 'thunder hammer', clientId = 3309, sell = 75000 },
		{ itemName = 'arcane staff', clientId = 3341, sell = 150000 },
		{ itemName = 'dark trinity mace', clientId = 8099, sell = 1400000 },
		{ itemName = 'jade hammer', clientId = 7422, sell = 25000 },
		{ itemName = 'dragon scale mail', clientId = 3386, sell = 40000 },
		{ itemName = 'dwarven armor', clientId = 3397, sell = 30000 },
		{ itemName = 'golden armor', clientId = 3360, sell = 20000 },
		{ itemName = 'magic plate armor', clientId = 3366, sell = 35000 },
		{ itemName = 'knight armor', clientId = 3370, sell = 5000 },
		{ itemName = 'noble armor', clientId = 3380, sell = 1000 },
		{ itemName = 'crown armor', clientId = 3381, sell = 12000 },
		{ itemName = 'pirate shirt', clientId = 6095, sell = 500 },
		{ itemName = 'dark armor', clientId = 3383, sell = 500 },
		{ itemName = 'demon armor', clientId = 3388, sell = 1200000 },
		{ itemName = 'amazon armor', clientId = 3394, sell = 1500 },
		{ itemName = 'elven mail', clientId =  3399, sell = 130000 },
		{ itemName = 'native armor', clientId = 3402, sell = 3000 },
		{ itemName = 'blue robe', clientId = 3567, sell = 11000 },
		{ itemName = 'terra mantle', clientId = 811, sell = 10000 },
		{ itemName = 'glacier robe', clientId = 824, sell = 15000 },
		{ itemName = 'lightning robe', clientId = 825, sell = 20000 },
		{ itemName = 'magma coat', clientId = 826, sell = 60000 },
		{ itemName = 'divine plate', clientId = 8057, sell = 125000 },
		{ itemName = 'crystalline armor', clientId = 8050, sell = 25000 },
		{ itemName = 'frozen plate', clientId = 8059, sell = 35000 },
		{ itemName = 'robe of the underworld', clientId = 8062, sell = 85000 },
		{ itemName = 'skullcracker armor', clientId = 8061, sell = 95000 },
	},
	["legs"] = {
		{ itemName = 'dragon scale legs', clientId = 3363, sell = 800000 },
		{ itemName = 'golden legs', clientId = 3364, sell = 80000 },
		{ itemName = 'knight legs', clientId = 3371, sell = 5000 },
		{ itemName = 'brass legs', clientId = 3372, sell = 90 },
		{ itemName = 'crown legs', clientId = 3382, sell = 12000 },
		{ itemName = 'demon legs', clientId = 3389, sell = 100000 },
		{ itemName = 'dwarven legs', clientId = 3398, sell = 3000 },
		{ itemName = 'elven legs', clientId = 3401, sell = 150000 },
		{ itemName = 'plate legs', clientId = 3557, sell = 200 },
		{ itemName = 'mammoth fur shorts', clientId = 7464, sell = 300 },
		{ itemName = 'terra legs', clientId = 812, sell = 60000 },
		{ itemName = 'magma legs', clientId = 821, sell = 70000 },
		{ itemName = 'lighting legs', clientId = 822, sell = 50000 },
		{ itemName = 'glacier kilt', clientId = 823, sell = 55000 },
		{ itemName = 'bast skirt', clientId = 3360, sell = 8000 },
		{ itemName = 'blue legs', clientId = 645, sell = 15000 },
	},
	["shields"] = {
		{ itemName = 'mastermind shield', clientId = 3414, sell = 52000 },
		{ itemName = 'guardian shield', clientId = 3415, sell = 2000 },
		{ itemName = 'dragon shield', clientId = 3416, sell = 5000 },
		{ itemName = 'bonelord shield', clientId = 3418, sell = 1000 },
		{ itemName = 'crown shield', clientId = 3419, sell = 8000 },
		{ itemName = 'demon shield', clientId = 3420, sell = 30000 },
		{ itemName = 'dark shield', clientId = 3421, sell = 500 },
		{ itemName = 'great shield', clientId = 3422, sell = 300000 },
		{ itemName = 'blessed shield', clientId = 3423, sell = 400000 },
		{ itemName = 'ornamented shield', clientId = 3424, sell = 2000 },
		{ itemName = 'dwarven shield', clientId = 3425, sell = 100 },
		{ itemName = 'rose shield', clientId = 3427, sell = 80000 },
		{ itemName = 'tower shield', clientId = 3428, sell = 8000 },
		{ itemName = 'black shield', clientId = 3429, sell = 1000 },
		{ itemName = 'viking shield', clientId = 3431, sell = 100 },
		{ itemName = 'ancient shield', clientId = 3432, sell = 1000 },
		{ itemName = 'griffin shield', clientId = 3433, sell = 1500 },
		{ itemName = 'vampire shield', clientId = 3434, sell = 15000 },
		{ itemName = 'castle shield', clientId = 3435, sell = 35000 },
		{ itemName = 'medusa shield', clientId = 3436, sell = 9000 },
		{ itemName = 'amazon shield', clientId = 3437, sell = 4000 },
		{ itemName = 'eagle shield', clientId = 3438, sell = 300000 },
		{ itemName = 'phoenix shield', clientId = 3439, sell = 500000 },
		{ itemName = 'scarab shield', clientId = 3440, sell = 2000 },
		{ itemName = 'bone shield', clientId = 3441, sell = 160 },
		{ itemName = 'tempest shield', clientId = 3442, sell = 80000 },
		{ itemName = 'tusk shield', clientId = 3443, sell = 1000 },
		{ itemName = 'sentinel shield', clientId = 3444, sell = 700 },
		{ itemName = 'salamander shield', clientId = 3445, sell = 600 },
		{ itemName = 'tortoise shield', clientId = 6131, sell = 200 },
		{ itemName = 'nightmare shield', clientId = 6390, sell = 120000 },
		{ itemName = 'norse shield', clientId = 7460, sell = 1500 },
		{ itemName = 'spellbook of dark mysteries', clientId = 8090, sell = 150000 },
		{ itemName = 'spellbook of enlightenment', clientId = 8072, sell = 5000 },
		{ itemName = 'spellbook of lost souls', clientId = 8075, sell = 50000 },
		{ itemName = 'spellbook of mind control', clientId = 8074, sell = 35000 },
		{ itemName = 'spellbook of warding', clientId =  8073, sell = 20000 },
		{ itemName = 'spellscroll of prophecies', clientId = 8076, sell = 180000 },
	},
	["helmets"] = {
		{ itemName = 'steel helmet', clientId = 3351, sell = 300 },
		{ itemName = 'iron helmet', clientId = 3353, sell = 150 },
		{ itemName = 'devil helmet', clientId = 3356, sell = 1200 },
		{ itemName = 'golden helmet', clientId = 3365, sell = 1500000 },
		{ itemName = 'viking helmet', clientId = 3367, sell = 50 },
		{ itemName = 'winged helmet', clientId = 3368, sell = 130000 },
		{ itemName = 'warrior helmet', clientId = 3369, sell = 5000 },
		{ itemName = 'strange helmet', clientId = 3373, sell = 500 },
		{ itemName = 'dark helmet', clientId = 3384, sell = 250 },
		{ itemName = 'crown helmet', clientId = 3385, sell = 2500 },
		{ itemName = 'demon helmet', clientId = 3387, sell = 200000 },
		{ itemName = 'horned helmet', clientId = 3390, sell = 100000 },
		{ itemName = 'crusader helmet', clientId = 3391, sell = 6000 },
		{ itemName = 'royal helmet', clientId = 3392, sell = 30000 },
		{ itemName = 'amazon helmet', clientId = 3393, sell = 1400 },
		{ itemName = 'ceremonial mask', clientId = 3395, sell = 1000 },
		{ itemName = 'dwarven helmet', clientId = 3396, sell = 100000 },
		{ itemName = 'dragon scale helmet', clientId = 3400, sell = 400000 },
		{ itemName = 'mystic turban', clientId = 3574, sell = 3000 },
		{ itemName = 'post officers hat', clientId =  3576, sell = 50000 },
		{ itemName = 'tribal mask', clientId = 3403, sell = 300 },
		{ itemName = 'horseman helmet', clientId = 3405, sell = 1000 },
		{ itemName = 'feather headdress', clientId = 3406, sell = 1500 },
		{ itemName = 'charmer tiara', clientId = 3407, sell = 13000 },
		{ itemName = 'bonelord helmet', clientId = 3408, sell = 20000 },
		{ itemName = 'santa hat', clientId = 6531, sell = 2300 },
		{ itemName = 'skull helmet', clientId = 5741, sell = 50000 },
		{ itemName = 'pirate hat', clientId = 6096, sell = 1000 },
		{ itemName = 'krimhorn helmet', clientId = 7461, sell = 250 },
		{ itemName = 'ragnir helmet', clientId = 7462, sell = 400 },
		{ itemName = 'fur cap', clientId = 7458, sell = 30000 },
		{ itemName = 'earmuffs', clientId = 7459, sell = 1000 },
		{ itemName = 'terra hood', clientId = 830, sell = 3500 },
		{ itemName = 'lighting headband', clientId = 828, sell = 8000 },
		{ itemName = 'glacier mask', clientId = 829, sell = 4000 },
	},
	["boots"] = {
		{ itemName = 'boots of haste', clientId = 3079, sell = 30000 },
		{ itemName = 'soft boots', clientId = 6529, sell = 400000 },
		{ itemName = 'boots of waterwalking', clientId = 3246, sell = 1000000 },
		{ itemName = 'sandals', clientId = 3551, sell = 100 },
		{ itemName = 'steel boots', clientId = 3554, sell = 30000 },
		{ itemName = 'golden boots', clientId = 3555, sell = 400000 },
		{ itemName = 'crocodile boots', clientId = 3556, sell = 1000 },
		{ itemName = 'pirate boots', clientId = 5461, sell = 5000 },
		{ itemName = 'fur boots', clientId = 7457, sell = 2000 },
		{ itemName = 'terra boots', clientId = 813, sell = 5000 },
		{ itemName = 'magma boots', clientId = 818, sell = 7000 },
		{ itemName = 'glacier shoes', clientId = 819, sell = 3000 },
		{ itemName = 'lighting boots', clientId = 820, sell = 7000 },
	},
	["bows"] = {
		{ itemName = 'composite hornbow', clientId = 8027, sell = 15000 }, 
		{ itemName = 'elethriels elemental bow', clientId = 8030, sell = 95000 },
	},
}

npcConfig.shop = {}
for _, categoryTable in pairs(itemsTable) do
	for _, itemTable in ipairs(categoryTable) do
		table.insert(npcConfig.shop, itemTable)
	end
end
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
	if categoryTable then
		npcHandler:say("Of course, just browse through my wares.", npc, player)
		npc:openShopWindowTable(player, categoryTable)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
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
