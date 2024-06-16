local internalNpcName = "Voicht"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 289,
	lookHead = 38,
	lookBody = 19,
	lookLegs = 21,
	lookFeet = 20,
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

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "animate dead rune", clientId = 3203, buy = 375 },
	{ itemName = "arrow", clientId = 3447, buy = 3 },
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "blue quiver", clientId = 35848, buy = 400 },
	{ itemName = "bolt", clientId = 3446, buy = 4 },
	{ itemName = "bottle", clientId = 2875, buy = 3 },
	{ itemName = "bow", clientId = 3350, buy = 400, sell = 100 },
	{ itemName = "bucket", clientId = 2873, buy = 4 },
	{ itemName = "candelabrum", clientId = 2911, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280, sell = 75 },
	{ itemName = "crossbow", clientId = 3349, buy = 500, sell = 120 },
	{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
	{ itemName = "crystalline arrow", clientId = 15793, buy = 20 },
	{ itemName = "desintegrate rune", clientId = 3197, buy = 26 },
	{ itemName = "diamond arrow", clientId = 35901, buy = 100 },
	{ itemName = "drill bolt", clientId = 16142, buy = 12 },
	{ itemName = "earth arrow", clientId = 774, buy = 5 },
	{ itemName = "empty potion flask", clientId = 283, sell = 5 },
	{ itemName = "empty potion flask", clientId = 284, sell = 5 },
	{ itemName = "empty potion flask", clientId = 285, sell = 5 },
	{ itemName = "energy bomb rune", clientId = 3149, buy = 203 },
	{ itemName = "envenomed arrow", clientId = 16143, buy = 12 },
	{ itemName = "fireball rune", clientId = 3189, buy = 30 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150, sell = 40 },
	{ itemName = "flaming arrow", clientId = 763, buy = 5 },
	{ itemName = "flash arrow", clientId = 761, buy = 5 },
	{ itemName = "great health potion", clientId = 239, buy = 225 },
	{ itemName = "great mana potion", clientId = 238, buy = 144 },
	{ itemName = "great spirit potion", clientId = 7642, buy = 228 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "health potion", clientId = 266, buy = 50 },
	{ itemName = "holy missile rune", clientId = 3182, buy = 16 },
	{ itemName = "icicle rune", clientId = 3158, buy = 30 },
	{ itemName = "machete", clientId = 3308, buy = 35, sell = 6 },
	{ itemName = "magic wall rune", clientId = 3180, buy = 116 },
	{ itemName = "mana potion", clientId = 268, buy = 56 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "onyx arrow", clientId = 7365, buy = 7 },
	{ itemName = "paralyze rune", clientId = 3165, buy = 700 },
	{ itemName = "pick", clientId = 3456, buy = 50, sell = 15 },
	{ itemName = "piercing bolt", clientId = 7363, buy = 5 },
	{ itemName = "poison bomb rune", clientId = 3173, buy = 85 },
	{ itemName = "power bolt", clientId = 3450, buy = 7 },
	{ itemName = "present", clientId = 2856, buy = 10 },
	{ itemName = "prismatic bolt", clientId = 16141, buy = 20 },
	{ itemName = "quiver", clientId = 35562, buy = 400 },
	{ itemName = "red quiver", clientId = 35849, buy = 400 },
	{ itemName = "rope", clientId = 3003, buy = 50, sell = 15 },
	{ itemName = "royal spear", clientId = 7378, buy = 15 },
	{ itemName = "scythe", clientId = 3453, buy = 50, sell = 10 },
	{ itemName = "shiver arrow", clientId = 762, buy = 5 },
	{ itemName = "shovel", clientId = 3457, buy = 50, sell = 8 },
	{ itemName = "sniper arrow", clientId = 7364, buy = 5 },
	{ itemName = "soulfire rune", clientId = 3195, buy = 46 },
	{ itemName = "spear", clientId = 3277, buy = 9, sell = 3 },
	{ itemName = "spectral bolt", clientId = 35902, buy = 70 },
	{ itemName = "stone shower rune", clientId = 3175, buy = 37 },
	{ itemName = "strong health potion", clientId = 236, buy = 115 },
	{ itemName = "strong mana potion", clientId = 237, buy = 93 },
	{ itemName = "supreme health potion", clientId = 23375, buy = 625 },
	{ itemName = "tarsal arrow", clientId = 14251, buy = 6 },
	{ itemName = "throwing star", clientId = 3287, buy = 42 },
	{ itemName = "thunderstorm rune", clientId = 3202, buy = 47 },
	{ itemName = "torch", clientId = 2920, buy = 2 },
	{ itemName = "ultimate health potion", clientId = 7643, buy = 379 },
	{ itemName = "ultimate mana potion", clientId = 23373, buy = 438 },
	{ itemName = "ultimate spirit potion", clientId = 23374, buy = 438 },
	{ itemName = "vial", clientId = 2874, sell = 5 },
	{ itemName = "vortex bolt", clientId = 14252, buy = 6 },
	{ itemName = "watch", clientId = 2906, buy = 20, sell = 6 },
	{ itemName = "wild growth rune", clientId = 3156, buy = 160 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	{ itemName = "worm", clientId = 3492, buy = 1 },
}

local npcs = {
	["voicht"] = {blacksmithingRecipes, (professionsConfig.storages).blacksmithing, "blacksmith", "blacksmithing"},
	["carthin"] = {inscriptionRecipes, (professionsConfig.storages).inscription, "scribe", "inscription"},
	["laurelhali"] = {leatherworkingRecipes, (professionsConfig.storages).leatherworking, "leatherworker", "leatherworking"},
	["erbeik"] = {alchemyRecipes, (professionsConfig.storages).alchemy, "alchemist", "alchemy"},
	["tigtram"] = {tailoringRecipes, (professionsConfig.storages).tailoring, "tailor", "tailoring"},
	["dalrl"] = {engeneeringRecipes, (professionsConfig.storages).engeneering, "engeneer", "engeneering"},
}
function creatureSayCallback(cid, type, msg)
	local profession = npcs[string.lower(getCreatureName(getNpcId()))]
	local professionStorage = getPlayerStorageValue(cid, professionsConfig.professionStorage)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(string.lower(getCreatureName(getNpcId())) == "voicht") then
		if(smeltingRecipes[string.lower(msg)]) then	
			for item, count in pairs(smelting[smeltingRecipes[string.lower(msg)]]) do
				if(doPlayerRemoveItem(cid, item, count) == true) then
					doPlayerAddItem(cid, getItemIdByName(smeltingRecipes[string.lower(msg)]), 1)
					doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HITBYFIRE)
					npcHandler:say("Here you are, a " .. smeltingRecipes[string.lower(msg)] .. ".", cid)
				else
					npcHandler:say("You don't have required ingredients.", cid)
				end
			end
		end
	end
	if(profession[1][string.lower(msg)]) then
		if(professionStorage ~= profession[4]) then
			npcHandler:say("You're not a/an " .. profession[3] .. ". But I can always teach you this art. Do you want to become a/an " .. profession[3] .. "? Remember you're goin to lose all your previous skills if so!", cid)
			talkState[talkUser] = 800
			return true
		end
		if(profession[1][string.lower(msg)].sellable) then
			if(getPlayerStorageValue(cid, profession[1][string.lower(msg)].storage) ~= 1) then
				talkState[talkUser] = profession[1][string.lower(msg)].storage
				npcHandler:say("Do you really want to learn how to craft {" .. string.lower(msg) .. "}?", cid)
			else
				npcHandler:say("You already know how to craft that.", cid)
				talkState[talkUser] = 0
			end
		elseif(not(profession[1][string.lower(msg)].sellable) and profession[1][string.lower(msg)].mission) then
			if(getPlayerStorageValue(cid, profession[1][string.lower(msg)].storage) ~= 1) then
				itemList = ""
				for items, count in pairs(profession[1][string.lower(msg)].mission) do
					itemList = itemList .. " " .. count .. "x " .. getItemNameById(items) .. ","
				end	
				talkState[talkUser] = profession[1][string.lower(msg)].storage
				npcHandler:say("If you want to learn how to craft {" .. profession[1][string.lower(msg)] .. "}, you have to bring me: {" .. itemList .. " " .. profession[1][string.lower(msg)].price .. "}. Do you have required materials now?", cid)
			else
				npcHandler:say("You've already completed this task for me.", cid)
				talkState[talkUser] = 0
			end
		end
	end
	if(msgcontains(msg, "store")) then
		npcHandler:say("Here's the list of recipes I've in my store:", cid)
		for names, values in pairs(profession[1]) do
			npcHandler:say("Recipe: " .. names .. " - skill: " .. values.skill .. ", cost: " .. values.price .. " gold coins. " .. (values.mission and "(special)" or ""), cid)
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 800) then
			npcHandler:say("Congratulations, you've become a/an " .. profession[3] .. "! From now you can browse and buy {recipes} from my {store}.", cid)
			talkState[talkUser] = 0
			for _, v in pairs(professionsConfig.storages) do
				setPlayerStorageValue(cid, v, 0)
			end
			setPlayerStorageValue(cid, professionsConfig.professionStorage, profession[4])
			return true
		elseif(talkState[talkUser] > 0) then
			for names, values in pairs(profession[1]) do
				if(talkState[talkUser] == values.storage) then
					if(getPlayerStorageValue(cid, profession[2]) < values.skill) then
						npcHandler:say("Your " .. profession[3] .. " skill is too low. The required skill is " .. values.skill .. ".", cid)
						talkState[talkUser] = 0
						return true
					end
					if(values.mission) then
						for items, count in pairs(values.mission) do
							if(getPlayerItemCount(cid, items) < count) then
								npcHandler:say("You don't have required items.", cid)
								talkState[talkUser] = 0
								return true
							end
						end
						if(doPlayerRemoveMoney(cid, values.price) == true) then
							for items, count in pairs(values.mission) do
								doPlayerRemoveItem(cid, items, count)
							end
							setPlayerStorageValue(cid, values.storage, 1)
							doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_RED)
							npcHandler:say("Here you are, your " .. names .. " recipe. Take care of it, becouse it's one of the rarest recipes in the world!", cid)
							talkState[talkUser] = 0
						else
							npcHandler:say("You don't have enought cash to buy this recipe.", cid)
							talkState[talkUser] = 0
						end
						return true
					end
					if(doPlayerRemoveMoney(cid, values.price) == true) then
						setPlayerStorageValue(cid, values.storage, 1)
						doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
						npcHandler:say("You learned the recipe of crafting {" .. names .. "}.", cid)
					else
						npcHandler:say("You don't have enought money.", cid)
					end
					talkState[talkUser] = 0
				end
			end
		end
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
