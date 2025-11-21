local config = {
	removeOnUse = false,
	usableOnTarget = true, -- can be used on target? (fe. healing friend)
	splashable = false,
	realAnimation = true, -- make text effect visible only for players in range 1x1
	healthMultiplier = 1.0,
	manaMultiplier = 1.0
}

--config.removeOnUse = getBooleanFromString(config.removeOnUse)
--config.usableOnTarget = getBooleanFromString(config.usableOnTarget)
--config.splashable = getBooleanFromString(config.splashable)
--config.realAnimation = getBooleanFromString(config.realAnimation)

local POTIONS = {
	[8205] = {empty = 8704, splash = 2, health = {450, 600}, mana = {270, 300}, level = 200, vocations = {3, 7, 11}, vocStr = "paladins"}, -- new palek
	[7488] = {empty = 8704, splash = 2, mana = {650, 700}, level = 200, vocations = {1, 2, 5, 6, 9, 10}, vocStr = "sorcerers and druids"}, -- new ed i ms
	[8474] = {empty = 8704, splash = 2, health = {1200, 1400}, level = 200, vocations = {4, 8, 12}, vocStr = "knights"}, -- new ek
	[9930] = {empty = 8704, splash = 2, mana = {700, 900}, level = 300, vocations = {1, 2, 5, 6, 9, 10}, vocStr = "sorcerers and druids"}, -- super magic potion

	[8704] = {empty = 7636, splash = 2, health = {50, 100}}, -- small health potion
	[7618] = {empty = 7636, splash = 2, health = {100, 200}}, -- health potion
	[7588] = {empty = 7634, splash = 2, health = {200, 400}, level = 50, vocations = {3, 4, 7, 8, 11 ,12}, vocStr = "knights and paladins"}, -- strong health potion
	[7591] = {empty = 7635, splash = 2, health = {500, 700}, level = 80, vocations = {4, 8, 12}, vocStr = "knights"}, -- great health potion
	[8473] = {empty = 7635, splash = 2, health = {800, 1000}, level = 130, vocations = {4, 8, 12}, vocStr = "knights"}, -- ultimate health potion

	[7620] = {empty = 7636, splash = 7, mana = {70, 130}}, -- mana potion
	[7589] = {empty = 7634, splash = 7, mana = {110, 190}, level = 50, vocations = {1, 2, 3, 5, 6, 7, 9, 10, 11}, vocStr = "sorcerers, druids and paladins"}, -- strong mana potion
	[7590] = {empty = 7635, splash = 7, mana = {300, 410}, level = 80, vocations = {1, 2, 5, 6, 9, 10}, vocStr = "sorcerers and druids"}, -- great mana potion

	[8472] = {empty = 7635, splash = 3, health = {200, 400}, mana = {110, 190}, level = 80, vocations = {3, 7, 11}, vocStr = "paladins"} -- great spirit potion
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (750))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	--domodlib('task_config')
	local potion = POTIONS[item.itemid]
	if(not potion) then
		return false
	end

        if getPlayerStorageValue(cid,21066) == 100000 then
        	doPlayerSendTextMessage(cid,22,"Congratulations! You earned the achievement \"Potion Addict\".")
   		doPlayerAddAchievement(cid, 66)
        end

	if(not isPlayer(itemEx.uid) or (config.usableOnTarget == false and cid ~= itemEx.uid)) then
		if(config.splashable == false) then
			return false
		end

		if(toPosition.x == CONTAINER_POSITION) then
			toPosition = getThingPos(item.uid)
		end

		doDecayItem(doCreateItem(2016, potion.splash, toPosition))
			
			if(fromPosition.x == CONTAINER_POSITION) then
				--doCreateItem(potion.empty, 1, getThingPos(item.uid))	--fix me!!!	
				doRemoveItem(item.uid, 1)

			else		
				doCreateItem(potion.empty, 1, getThingPos(item.uid))
				doRemoveItem(item.uid, 1)			
			end
			
		return true
	end

	if(hasCondition(cid, CONDITION_EXHAUST)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end

	if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and
		not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES))
	then
		doCreatureSay(itemEx.uid, "Only " .. potion.vocStr .. (potion.level and (" of level " .. potion.level) or "") .. " or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return true
	end

	local health = potion.health
	if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.healthMultiplier))) then
		return false
	end

	local mana = potion.mana
	if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.manaMultiplier))) then
		return false
	end

	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	if(config.realAnimation == false) then
		doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1)
	else
		for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1, false, tid)
				setPlayerStorageValue(cid, 21066, getCreatureStorage(cid, 21066) + 1)
			end
		end
	end

	doAddCondition(cid, exhaust)
	if(not potion.empty or config.removeOnUse) then
		doRemoveItem(item.uid)
		return true
	end	
	if(fromPosition.x == CONTAINER_POSITION) then
	    --doCreateItem(potion.empty, 1, getThingPos(item.uid))	--fix me!!!	
		doRemoveItem(item.uid, 1)

	else		
		doCreateItem(potion.empty, 1, getThingPos(item.uid))
		doRemoveItem(item.uid, 1)			
	end
		--doTransformItem(item.uid, potion.empty, 1)
	local p = (getPlayerVocation(cid) - 4 > 0) and taskConfig.potion[getPlayerVocation(cid)-4] or taskConfig.potion[getPlayerVocation(cid)]	
	if getCreatureStorage(cid, p.storage) >= 0 then
		if getCreatureStorage(cid, p.doneStorage) < 1 then
			if getCreatureStorage(cid, p.storage) + 1 >= p.uses then
				doCreatureSetStorage(cid, p.storage, p.uses)
				doCreatureSetStorage(cid, p.doneStorage, 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[TASK] You have finished task. You have used enough potions and you got a reward.')
				
				doPlayerAddExperience(cid, p.exp)
				local backpack = doPlayerAddItem(cid, 11244, 1)
				for k, v in ipairs(p.items) do
					doAddContainerItem(backpack, v[1], v[2])
				end
			else
				doCreatureSetStorage(cid, p.storage, math.max(0, getCreatureStorage(cid, p.storage)) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[TASK] You used '..getCreatureStorage(cid, p.storage)..'/'..p.uses..' potions for potion task.')
			end
		end
	end
	
	local p = (getPlayerVocation(cid) - 4 > 0) and taskConfig.superPotion[getPlayerVocation(cid)-4] or taskConfig.superPotion[getPlayerVocation(cid)]	
	if getCreatureStorage(cid, p.storage) >= 0 then
		if getCreatureStorage(cid, p.doneStorage) < 1 then
			if getCreatureStorage(cid, p.storage) + 1 >= p.uses then
				doCreatureSetStorage(cid, p.storage, p.uses)
				doCreatureSetStorage(cid, p.doneStorage, 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[TASK] You have finished task. You have used enough potions to get super potion and you got a reward.')
				
				doPlayerAddExperience(cid, p.exp)
				doPlayerAddItem(cid, p.potion, 1)
			else
				doCreatureSetStorage(cid, p.storage, math.max(0, getCreatureStorage(cid, p.storage)) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, '[TASK] You used '..getCreatureStorage(cid, p.storage)..'/'..p.uses..' potions for super potion task.')
			end
		end
	end
	return true
end
