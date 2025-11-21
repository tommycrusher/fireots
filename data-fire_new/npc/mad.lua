local internalNpcName = "Mad"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 129,
	lookHead = 75,
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
	{ text = "Check out my good and sturdy weapons!" },
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

function OldBackpack(cid, message, keywords, parameters, node)
 
    if(not npcHandler:isFocused(cid)) then
        return false
    end
 
    if getPlayerItemCount(cid, 3960) >= 1 and getPlayerStorageValue(cid, 21002) < 0 then
                npcHandler:say("Thank you very much! This brings back good old memories! Please, as a reward, travel to Kazordoon and ask my old friend {Kroox} to provide you a special dwarven armor.", cid)
		npcHandler:say("I will mail him about you immediately. Just tell him, his old buddy sam is sending you.", cid)
                doPlayerSendTextMessage(cid,22,"Congratulations! You earned the achievement \"Backpack Tourist\".")
   	        setPlayerStorageValue(cid,21002,1)
                doPlayerRemoveItem(cid, 3960, 1)
        else
            npcHandler:say("Thank you for your concern, but I don't think this is my backpack, since you gave it to me already", cid)
    end
end

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "axe", clientId = 3274, buy = 20, sell = 7 },
	{ itemName = "small axe", clientId = 3462, sell = 5 },
	{ itemName = "battle axe", clientId = 3266, buy = 235, sell = 80 },
	{ itemName = "battle hammer", clientId = 3305, buy = 350, sell = 120 },
	{ itemName = "bone club", clientId = 3337, sell = 5 },
	{ itemName = "swampling club", clientId = 17824, sell = 40 },
	{ itemName = "studded club", clientId = 3336, sell = 10 },
	{ itemName = "bone sword", clientId = 3338, buy = 75, sell = 20 },
	{ itemName = "carlin sword", clientId = 3283, buy = 473, sell = 118 },
	{ itemName = "club", clientId = 3270, buy = 5, sell = 1 },
	{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
	{ itemName = "dagger", clientId = 3267, buy = 5, sell = 2 },
	{ itemName = "double axe", clientId = 3275, sell = 260 },
	{ itemName = "durable exercise axe", clientId = 35280, buy = 945000, count = 1800 },
	{ itemName = "durable exercise bow", clientId = 35282, buy = 945000, count = 1800 },
	{ itemName = "durable exercise club", clientId = 35281, buy = 945000, count = 1800 },
	{ itemName = "durable exercise shield", clientId = 44066, buy = 945000, count = 1800 },
	{ itemName = "durable exercise sword", clientId = 35279, buy = 945000, count = 1800 },
	{ itemName = "exercise axe", clientId = 28553, buy = 262500, count = 500 },
	{ itemName = "exercise bow", clientId = 28555, buy = 262500, count = 500 },
	{ itemName = "exercise club", clientId = 28554, buy = 262500, count = 500 },
	{ itemName = "exercise shield", clientId = 44065, buy = 262500, count = 500 },
	{ itemName = "exercise sword", clientId = 28552, buy = 262500, count = 500 },
	{ itemName = "fire sword", clientId = 3280, sell = 1000, buy = 13000 },
	{ itemName = "halberd", clientId = 3269, sell = 400, buy = 1500 },
	{ itemName = "hand axe", clientId = 3268, buy = 8, sell = 4 },
	{ itemName = "hatchet", clientId = 3276, sell = 25, buy = 125 },
	{ itemName = "katana", clientId = 3300, sell = 35 },
	{ itemName = "lasting exercise axe", clientId = 35286, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise shield", clientId = 44067, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 7560000, count = 14400 },
	{ itemName = "longsword", clientId = 3285, buy = 160, sell = 51 },
	{ itemName = "mace", clientId = 3286, buy = 90, sell = 30 },
	{ itemName = "morning star", clientId = 3282, buy = 430, sell = 100 },
	{ itemName = "orcish axe", clientId = 3316, sell = 350 },
	{ itemName = "rapier", clientId = 3272, buy = 15, sell = 5 },
	{ itemName = "sabre", clientId = 3273, buy = 35, sell = 12 },
	{ itemName = "short sword", clientId = 3294, buy = 26, sell = 10 },
	{ itemName = "sickle", clientId = 3293, buy = 7, sell = 3 },
	{ itemName = "spike sword", clientId = 3271, buy = 8000, sell = 240 },
	{ itemName = "sword", clientId = 3264, buy = 85, sell = 25 },
	{ itemName = "throwing knife", clientId = 3298, buy = 25, sell = 2 },
	{ itemName = "two handed sword", clientId = 3265, buy = 950, sell = 450 },
	{ itemName = "war hammer", clientId = 3279, buy = 10000, sell = 470 },
	
	{ itemName = "royal helmet", clientId = 3392, buy = 40000, sell = 7500 },
	{ itemName = "warrior helmet", clientId = 3390, buy = 6000, sell = 1470 },
	{ itemName = "crusader helmet", clientId = 3391, buy = 9000, sell = 470 },
	{ itemName = "crown helmet", clientId = 3385, sell = 5000 },
	{ itemName = "devil helmet", clientId = 3356, sell = 4000 },
	{ itemName = "mystic turban", clientId = 3574, sell = 500 },
	{ itemName = "chain helmet", clientId = 3352, sell = 35 },
	{ itemName = "iron helmet", clientId = 3353, sell = 30 },
	
	{ itemName = "steel boots", clientId = 3554, sell = 400000 },
	{ itemName = "boots of haste", clientId = 3079, sell = 40000 },
	{ itemName = "golden boots", clientId = 3555, sell = 100000 },
	
	{ itemName = "magic plate armor", clientId = 3366, sell = 100000 },
	{ itemName = "dragon scale mail", clientId = 3386, sell = 60000 },
	{ itemName = "demon armor", clientId = 3388, sell = 90000 },
	{ itemName = "golden armor", clientId = 3360, sell = 30000 },
	{ itemName = "crown armor", clientId = 3381, sell = 20000 },
	{ itemName = "knight armor", clientId = 3370, sell = 5000 },
	{ itemName = "blue robe", clientId = 3367, sell = 15000 },
	{ itemName = "plate armor", clientId = 3357, sell = 400 },
	{ itemName = "brass armor", clientId = 3359, sell = 200 },
	{ itemName = "chain armor", clientId = 3358, sell = 100 },
	
	{ itemName = "golden legs", clientId = 3364, sell = 80000 },
	{ itemName = "crown legs", clientId = 3382, sell = 15000 },
	{ itemName = "knight legs", clientId = 3371, sell = 6000 },
	{ itemName = "plate legs", clientId = 3557, sell = 500 },
	{ itemName = "brass legs", clientId = 3372, sell = 100 },
	
	{ itemName = "mastermind shield", clientId = 3414, sell = 80000 },
	{ itemName = "demon shield", clientId = 3420, sell = 40000 },
	{ itemName = "blessed shield", clientId = 3423, sell = 150000 },
	{ itemName = "great shield", clientId = 3422, sell = 100000 },
	{ itemName = "vampire shield", clientId = 3434, sell = 25000 },
	{ itemName = "medusa shield", clientId = 3436, sell = 8000 },
	{ itemName = "amazon shield", clientId = 3437, sell = 4000 },
	{ itemName = "crown shield", clientId = 3419, sell = 5000 },
	{ itemName = "tower shield", clientId = 3428, sell = 4000 },
	{ itemName = "guardian shield", clientId = 3415, sell = 200 },
	{ itemName = "beholder shield", clientId = 3418, sell = 1500 },
	{ itemName = "dwarven shield", clientId = 3425, sell = 100 },
	
	{ itemName = "magic longsword", clientId = 3278, sell = 150000 },
	{ itemName = "warlord sword", clientId = 3296, sell = 100000 },
	{ itemName = "magic sword", clientId = 3288, sell = 90000 },
	{ itemName = "giant sword", clientId = 3281, sell = 10000 },
	{ itemName = "bright sword", clientId = 3295, sell = 16000 },
	{ itemName = "ice rapier", clientId = 3284, sell = 14000 },
	{ itemName = "serpent sword", clientId = 3297, sell = 11500 },
	{ itemName = "broadsword", clientId = 3301, sell = 170 },
	
	{ itemName = "dragon lance", clientId = 3302, sell = 10000 },
	{ itemName = "stonecutter axe", clientId = 3319, sell = 90000 },
	{ itemName = "guardian halberd", clientId = 3315, sell = 7500 },
	{ itemName = "fire axe", clientId = 3320, sell = 10000 },
	{ itemName = "knight axe", clientId = 3318, sell = 5000 },
	
	{ itemName = "thunder hammer", clientId = 3309, sell = 90000 },
	{ itemName = "skull staff", clientId = 3324, sell = 1000 },
	{ itemName = "dragon hammer", clientId = 3322, sell = 2000 },
	{ itemName = "clerical mace", clientId = 3311, sell = 200 },
	{ itemName = "demonrage sword", clientId = 7382, sell = 10000 },
	{ itemName = "dragonbone staff", clientId = 7430, sell = 1500 },
	{ itemName = "demonbone", clientId = 7431, sell = 5000 },
	{ itemName = "dragon slayer", clientId = 7402, sell = 1500 },
	{ itemName = "chaos mace", clientId = 7427, sell = 5000 },
	{ itemName = "hammer of warth", clientId = 3332, sell = 20000 },
	{ itemName = "ruthless axe", clientId = 6553, sell = 35000 },
	{ itemName = "titan axe", clientId = 7413, sell = 3500 },
}
-- Basic
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I am Romella and I will be serving you today." })
keywordHandler:addAliasKeyword({ "job" })

keywordHandler:addKeyword({ "weapons" }, StdModule.say, { npcHandler = npcHandler, text = "I have many weapons to offer. If you'd like to see my offers, ask me for a {trade}." })
keywordHandler:addKeyword({ "offers" }, StdModule.say, { npcHandler = npcHandler, text = "I sell and buy weapons. If you'd like to see my offers, ask me for a {trade}." })
keywordHandler:addAliasKeyword({ "ware" })

keywordHandler:addKeyword({ "army" }, StdModule.say, { npcHandler = npcHandler, text = "Our warehouse is the main supplier of the local garrison." })
keywordHandler:addKeyword({ "news" }, StdModule.say, { npcHandler = npcHandler, text = "It says the amazons are looking for a certain magical weapon in this area." })
keywordHandler:addKeyword({ "amazons" }, StdModule.say, { npcHandler = npcHandler, text = "I wonder how they finance themselves. I bet they are secretly trading in some strange stuff." })
keywordHandler:addKeyword({ "ferumbras" }, StdModule.say, { npcHandler = npcHandler, text = "Make sure to buy some extra weapons before facing that one." })
keywordHandler:addKeyword({ "excalibug" }, StdModule.say, { npcHandler = npcHandler, text = "I heard the amazons are after it." })
keywordHandler:addKeyword({ "swamps" }, StdModule.say, { npcHandler = npcHandler, text = "Don't go exploring without weapons. Especially you'll need a machete." })

npcHandler:setMessage(MESSAGE_GREET, "I welcome thee, |PLAYERNAME|! I suppose you are looking for a trade in fine weapons!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye and please bring more gold next time <chuckles>. I mean, it would be nice to see you again.")

keywordHandler:addKeyword({'helmets'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I buy royal (40k), warrior (6k), crusader (9k), crown (5k), devil (4k), chain (35gp) and iron helmets (30gp), also mystic turbans (500gp).'})
keywordHandler:addKeyword({'boots'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I buy golden boots (100k), steel boots (40k) and boots of haste (40k).'})
keywordHandler:addKeyword({'armors'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I buy golden (30k), crown (20k), knight (5k), lady (7,5k), plate (400gp), brass (200gp) and chain armors (100gp), also mpa (100k), dsm (60k) and blue robes (15k).'})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I buy golden (80k), crown (15k), knight (6k), plate (500gp) and brass legs (100gp).'})
keywordHandler:addKeyword({'shields'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I buy blessed (150k), great (100k), demon (40k), vampire (25k), medusa (8k), amazon (4k), crown (5k), tower (4k), dragon (3k), guardian (2k), beholder (1k), and dwarven shields (100gp), also mms (80k).'})
keywordHandler:addKeyword({'swords'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I buy giant (10k), bright (6k), fire (3k) serpent (1.5k), spike (800gp) and two handed swords (400gp), also ice rapiers (4k), magic longswords (150k), magic swords (90k), warlord swords (100k) broad swords (70gp), short swords (30gp), sabres (25gp) and swords (25gp).'})
keywordHandler:addKeyword({'axes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I buy fire (10k), guardian halberds (7,5k) knight (2k), double (200gp) and battle axes (100gp), also dragon lances (10k), stonecutters axes (90k), halberds (200gp) and hatchets (20gp).'})
keywordHandler:addKeyword({'clubs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I buy thunder hammers (90k), war (6k), dragon (2k) and battle hammers (60gp), also skull staffs (10k) and clerical maces (200gp).'})

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
