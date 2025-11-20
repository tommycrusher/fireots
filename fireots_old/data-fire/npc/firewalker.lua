local internalNpcName = "Firewalker"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 152,
	lookHead = 114,
	lookBody = 114,
	lookLegs = 114,
	lookFeet = 114,
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, 'firewalker') or MsgContains(message, ' firewalker boots') then
		npcHandler:say('Do you want to repair your worn soft boots for 50000 gold coins?',  npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif npcHandler:getTopic(playerId) == 1 then
		if(getPlayerItemCount(playerId, 9020) >= 1) then
			if(doPlayerRemoveMoney(playerId, 50000) == TRUE) then
				doPlayerRemoveItem(playerId, 9020, 1)
				doPlayerAddItem(playerId, 9019)
				npcHandler:say('Here you are.', npc, creature)
			else
				npcHandler:say('Sorry, you don\'t have enough gold.', npc, creature)
			end
		--elseif (getPlayerItemCount(cid, 10021) >= 1) then
		--	if(doPlayerRemoveMoney(cid, 10000) == TRUE) then
		--		doPlayerRemoveItem(cid, 10021, 1)
		--		doPlayerAddItem(cid, 2640)
		--		npcHandler:say('Here you are.', npc, creature)
		--	else
		--		npcHandler:say('Sorry, you don\'t have enough gold.', npc, creature)
		--	end
		else
			npcHandler:say('Sorry, you don\'t have the item.', npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	elseif MsgContains(message, 'no') then
		npcHandler:setTopic(playerId, 0)
		npcHandler:say('Ok then.', npc, creature)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
