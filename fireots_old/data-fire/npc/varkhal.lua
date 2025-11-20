local internalNpcName = "Varkhal"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 78,
	lookBody = 88,
	lookLegs = 0,
	lookFeet = 88,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
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

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can give you citizen, hunter, knight, mage, nobleman, summoner, warrior, barbarian, druid, wizard, oriental, pirate, assassin, beggar, shaman, norseman, nightmare, jester, yalaharian, warmaster, brotherhood, wayfarer, aflicted, elementalist and deepling addons.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To buy the first addon say \'first NAME addon\', for the second addon say \'second NAME addon\'.'})

local function creatureSayCallback(npc, creature, type, message, parameters, node)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
	if (parameters.confirm ~= true) and (parameters.decline ~= true) then
		if(getPlayerPremiumDays(playerId) == 0) and (parameters.premium == true) then
		    npcHandler:say('Sorry, but this addon is only for premium players!', npc, creature)
		    npcHandler:setTopic(playerId, 0)
		    return true
	end
	if (getPlayerStorageValue(playerId, parameters.storageID) ~= -1) then
		npcHandler:say('You already have this addon!', npc, creature)
		npcHandler:setTopic(playerId, 0)
		return true
	end
	local itemsTable = parameters.items
	local items_list = ''
	if table.maxn(itemsTable) > 0 then
		for i = 1, table.maxn(itemsTable) do
		local item = itemsTable[i]
		items_list = items_list .. item[2] .. ' ' .. getItemName(item[1])
			if i ~= table.maxn(itemsTable) then
				items_list = items_list .. ', '
			end
		end
	end
	local text = ''
	if (parameters.cost > 0) and table.maxn(parameters.items) then
		text = items_list .. ' and ' .. parameters.cost .. ' gp'
	elseif (parameters.cost > 0) then
		text = parameters.cost .. ' gp'
	elseif table.maxn(parameters.items) then
		text = items_list
	end
	npcHandler:say('Did you bring me ' .. text .. ' for ' .. message[1] .. '?', npc, creature)
	npcHandler:setTopic(playerId, 1)
	elseif (parameters.confirm == true) and npcHandler:getTopic(playerId) == 1 then
		local addonNode = node:getParent()
		local addoninfo = addonNode:getParameters()
		local items_number = 0
		if table.maxn(addoninfo.items) > 0 then
			for i = 1, table.maxn(addoninfo.items) do
				local item = addoninfo.items[i]
				if (getPlayerItemCount(playerId,item[1]) >= item[2]) then
				items_number = items_number + 1
			end
		end
		if(getPlayerMoney(playerId) >= addoninfo.cost) and (items_number == table.maxn(addoninfo.items)) then
			doPlayerRemoveMoney(playerId, addoninfo.cost)
			if table.maxn(addoninfo.items) > 0 then
				for i = 1, table.maxn(addoninfo.items) do
		            	local item = addoninfo.items[i]
		            	doPlayerRemoveItem(playerId,item[1],item[2])
		        	end
			end
		player:setStorageValue(addoninfo.storageID,1)	
		player:addOutfitAddon(addoninfo.outfit_male, addoninfo.addon)
		player:addOutfitAddon(addoninfo.outfit_female, addoninfo.addon)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		npcHandler:say('Here you are.', npc, creature)
		end
	else
		npcHandler:say('You do not have needed items or cash!', npc, crature)
	end
	npcHandler:setTopic(playerId, 0)
	return true
	elseif (parameters.decline == true) then
		npcHandler:say('Not interested? Maybe other addon?', npc, creature)
		npcHandler:setTopic(playerId, 0)
		return true
	end
	return true
end


local noNode = KeywordNode:new({'no'}, creatureSayCallback, {decline = true})
local yesNode = KeywordNode:new({'yes'}, creatureSayCallback, {confirm = true})

-- citizen (done)
local outfit_node = keywordHandler:addKeyword({'first citizen addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5878,100}}, outfit_female = 136, outfit_male = 128, addon = 1, storageID = 10001})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second citizen addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5890,100}, {5902,50}, {2480,1}}, outfit_female = 136, outfit_male = 128, addon = 2, storageID = 10002})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- hunter (done)
local outfit_node = keywordHandler:addKeyword({'first hunter addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5947,1}, {5876,100}, {5948,100}, {5891,5}, {5887,1}, {5889,1}, {5888,1}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 10003})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second hunter addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5875,1}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 10004})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- knight (done)
local outfit_node = keywordHandler:addKeyword({'first knight addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5880,100}, {5892,1}}, outfit_female = 139, outfit_male = 131, addon = 1, storageID = 10005})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second knight addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5893,100}, {5924,1}, {5885,1}, {5887,1}}, outfit_female = 139, outfit_male = 131, addon = 2, storageID = 10006})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- mage (done)
local outfit_node = keywordHandler:addKeyword({'first mage addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{2182,1}, {2186,1}, {2185,1}, {8911,1}, {2181,1}, {2183,1}, {2190,1}, {2191,1}, {2188,1}, {8921,1}, {2189,1}, {2187,1}, {2392,30}, {5809,1}, {2193,20}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = 10007}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 
local outfit_node = keywordHandler:addKeyword({'second mage addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5903,1}}, outfit_female = 138, outfit_male = 130, addon = 2, storageID = 10008}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 


-- summoner (done)
local outfit_node = keywordHandler:addKeyword({'first summoner addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5878,100}, {5958,1}}, outfit_female = 141, outfit_male = 133, addon = 1, storageID = 10009}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 
local outfit_node = keywordHandler:addKeyword({'second summoner addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5894,70}, {5911,20}, {5883,40}, {5922,35}, {5879,10}, {5881,60}, {5882,40}, {2392,3}, {5905,30}}, outfit_female = 141, outfit_male = 133, addon = 2, storageID = 10010}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 


-- barbarian (done)
local outfit_node = keywordHandler:addKeyword({'first barbarian addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5884,1}, {5885,1}, {5910,50}, {5911,50}, {5886,10}}, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 10011})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second barbarian addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5880,100}, {5892,1}, {5893,50}, {5876,50}}, outfit_female = 147, outfit_male = 143, addon = 2, storageID = 10012})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- druid (done)
local outfit_node = keywordHandler:addKeyword({'first druid addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5896,50}, {5897,50}}, outfit_female = 148, outfit_male = 144, addon = 1, storageID = 10013})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second druid addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5906,100}, {5938,1}, {5940,1}}, outfit_female = 148, outfit_male = 144, addon = 2, storageID = 10014})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- nobleman (done)
local outfit_node = keywordHandler:addKeyword({'first nobleman addon'}, creatureSayCallback, {premium = true, cost = 150000, items = {}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 10015})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second nobleman addon'}, creatureSayCallback, {premium = true, cost = 150000, items = {}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 10016})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- oriental (done)
local outfit_node = keywordHandler:addKeyword({'first oriental addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5945,1}}, outfit_female = 150, outfit_male = 146, addon = 1, storageID = 10017})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second oriental addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5883,100}, {5895,100}, {5891,2}, {5912,100}}, outfit_female = 150, outfit_male = 146, addon = 2, storageID = 10018})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- warrior (done)
local outfit_node = keywordHandler:addKeyword({'first warrior addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5925,100}, {5899,100}, {5884,1}, {5919,1}}, outfit_female = 142, outfit_male = 134, addon = 1, storageID = 10019})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second warrior addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5880,100}, {5887,1}}, outfit_female = 142, outfit_male = 134, addon = 2, storageID = 10020})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- wizard (done)
local outfit_node = keywordHandler:addKeyword({'first wizard addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{2536,1}, {2492,1}, {2488,1}, {2123,1}}, outfit_female = 149, outfit_male = 145, addon = 1, storageID = 10021})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second wizard addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5922,50}}, outfit_female = 149, outfit_male = 145, addon = 2, storageID = 10022})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- assassin (done)
local outfit_node = keywordHandler:addKeyword({'first assassin addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5912,50}, {5910,50}, {5911,50}, {5913,50}, {5914,50}, {5909,50}, {5886,10}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 10023})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second assassin addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5804,1}, {5930,10}}, outfit_female = 156, outfit_male = 152, addon = 2, storageID = 10024})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- beggar (done)
local outfit_node = keywordHandler:addKeyword({'first beggar addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5878,50}, {5921,30}, {5913,20}, {5894,10}}, outfit_female = 157, outfit_male = 153, addon = 1, storageID = 10025})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second beggar addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5883,100}, {2160,2}, {6107,1}}, outfit_female = 157, outfit_male = 153, addon = 2, storageID = 10026})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- pirate (done)
local outfit_node = keywordHandler:addKeyword({'first pirate addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{6098,100}, {6126,100}, {6097,100}}, outfit_female = 155, outfit_male = 151, addon = 1, storageID = 10027})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second pirate addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{11424,1}, {11425,1}, {11426,1}, {6102,1}}, outfit_female = 155, outfit_male = 151, addon = 2, storageID = 10028})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- shaman (done)
local outfit_node = keywordHandler:addKeyword({'first shaman addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5810,5}, {3955,5}, {5015,1}}, outfit_female = 158, outfit_male = 154, addon = 1, storageID = 10029})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second shaman addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{3966,5}, {3967,5}}, outfit_female = 158, outfit_male = 154, addon = 2, storageID = 10030})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- norseman (done)
local outfit_node = keywordHandler:addKeyword({'first norseman addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{7290,5}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10031})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second norseman addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{7290,10}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10032})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- jester (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first jester addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5912,50}, {5913,50}, {5914,50}, {5909,50}}, outfit_female = 270, outfit_male = 273, addon = 1, storageID = 10033})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second jester addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5912,50}, {5910,50}, {5911,50}, {5912,50}}, outfit_female = 270, outfit_male = 273, addon = 2, storageID = 10034})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- demonhunter (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first demonhunter addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5905,30}, {5906,40}, {5954,50}, {6500,50}, {2151,100}}, outfit_female = 288, outfit_male = 289, addon = 1, storageID = 10035})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second demonhunter addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{5906,50}, {6500,200}, {2151,100}}, outfit_female = 288, outfit_male = 289, addon = 2, storageID = 10036})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- nightmare (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first nightmare addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{6500,1500}}, outfit_female = 269, outfit_male = 268, addon = 1, storageID = 10037})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second nightmare addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{6500,1500}}, outfit_female = 269, outfit_male = 268, addon = 2, storageID = 10038})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- brotherhood (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first brotherhood addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{6500,1500}}, outfit_female = 279, outfit_male = 278, addon = 1, storageID = 10039})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second brotherhood addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{6500,1500}}, outfit_female = 279, outfit_male = 278, addon = 2, storageID = 10040})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- yalaharian (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first yalaharian addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{9955,1}}, outfit_female = 324, outfit_male = 325, addon = 1, storageID = 10041})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second yalaharian addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{9955,1}}, outfit_female = 324, outfit_male = 325, addon = 2, storageID = 10042})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- warmaster (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first warmaster addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{11330,100}, {11337,100}, {11315,1}}, outfit_female = 336, outfit_male = 335, addon = 1, storageID = 10043})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second warmaster addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{11366,100}, {11361,100}, {11315,1}}, outfit_female = 336, outfit_male = 335, addon = 2, storageID = 10044})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- wayfarer (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first wayfarer addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{12638,100}, {12639,100}, {12640,100}, {12657,1}}, outfit_female = 366, outfit_male = 367, addon = 1, storageID = 10045})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second wayfarer addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{12637,100}, {12636,100}, {12656,1}}, outfit_female = 366, outfit_male = 367, addon = 2, storageID = 10046})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- afflicted (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first afflicted addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{13545,1}, {13543,1}, {13541,1}, {13542,1}, {13540,1}, {13544,1}}, outfit_female = 431, outfit_male = 430, addon = 1, storageID = 10047})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second afflicted addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{13926,1}, {13925,1}}, outfit_female = 431, outfit_male = 430, addon = 2, storageID = 10048})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)

-- elementalist (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first elementalist addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{2146,100}, {13601,1}}, outfit_female = 433, outfit_male = 432, addon = 1, storageID = 10049})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second elementalist addon'}, creatureSayCallback, {premium = true, cost = 0, items = {{2145,100}, {13940,1}, {13756,1}, {13940,1}}, outfit_female = 433, outfit_male = 432, addon = 2, storageID = 10050})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
	
-- Deepling (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first deepling addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{13870,100}, {15432,1}}, outfit_female = 464, outfit_male = 463, addon = 1, storageID = 10051})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second deepling addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{15421,100}, {15435,100}, {15434,100}, {15436,100}}, outfit_female = 464, outfit_male = 463, addon = 2, storageID = 10052})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- Insectoid (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first insectoid addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{15622,100}}, outfit_female = 466, outfit_male = 465, addon = 1, storageID = 10053})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second insectoid addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{15486,100}}, outfit_female = 466, outfit_male = 465, addon = 2, storageID = 10054})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- Red Baron (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first red baron addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{13870,100}}, outfit_female = 471, outfit_male = 472, addon = 1, storageID = 10055})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second red baron addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{15421,100}}, outfit_female = 471, outfit_male = 472, addon = 2, storageID = 10056})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- Crystal Warlord (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first crystal warlord addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{18520,1}}, outfit_female = 513, outfit_male = 512, addon = 1, storageID = 10057})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second crystal warlord addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{18521,1}, {18522,1}}, outfit_female = 513, outfit_male = 512, addon = 2, storageID = 10058})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- Soil Guardian (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first soil guardian addon'}, creatureSayCallback, {premium = false, cost = 0, items = {{18517,1}}, outfit_female = 514, outfit_male = 516, addon = 1, storageID = 10059})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second soil guardian addon'}, creatureSayCallback, {premium = false, cost = 100, items = {{18518,1}, {18519,1}}, outfit_female = 514, outfit_male = 516, addon = 2, storageID = 10060})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. Will you help me? If you do, I'll reward you with nice addons! Just say {addons} or {help} if you don't know what to do.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)


-- npcType registering the npcConfig table
npcType:register(npcConfig)
