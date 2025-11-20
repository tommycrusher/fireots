local internalNpcName = "Arener"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 153,
	lookHead = 39,
	lookBody = 39,
	lookLegs = 39,
	lookFeet = 76,
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
function enterArena(cid, message, keywords, parameters, node)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	if string.lower(keywords[1]) == 'yes' and parameters.prepare == 1 then
		if getPlayerStorageValue(cid, myArenaLevel) < 3 then
			local enterArena = myArenaLevelIs(cid)
			if getPlayerLevel(cid) >= enterArena.RLV then
				npcHandler:say('You test will be ' .. enterArena.LN .. ' level. If you want enter you must pay ' ..enterArena.RC.. ' gp and have ' ..enterArena.RLV.. ' level. Wanna try?', cid)
				if getPlayerMoney(cid) >= enterArena.RC then
					setPlayerStorageValue(cid, talkNPC, 1)
					doPlayerRemoveMoney(cid, enterArena.RC)
					npcHandler:say("Now you can go to test... ".. enterArena.LN .."", cid)
            			else
                			npcHandler:say('You don\'t have ' ..enterArena.RC.. ' gp! Come back when you will be ready!', cid)
            			end
        		else
            			npcHandler:say('You don\'t have ' ..enterArena.RLV.. ' level! Come back when you will be ready!', cid)
        		end
        	else
            		npcHandler:say('You did all arena levels.',cid)
        	end
        	npcHandler:resetNpc()
	elseif string.lower(keywords[1]) == 'no' then
		npcHandler:say('Come back later then!', cid)
		npcHandler:resetNpc()
    	end
    	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hello |PLAYERNAME|! Do you want to make arena?')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, enterArena)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)

