-- Exhausted Settings --
local exhausted_seconds = 20 
local exh_storageadd = 18013
local exh_secondsadd = 20
-- Exhausted Settings END --
local storage = 18009 -- storage value for the vocation transformation --
local prostorage = 18010 -- storage value for the promotion transformation --
local storageadd = 18011 -- storage value for the add --
local check = 18012
local sorcerervoc = 9 -- 9 number is the vocation id of an epic master sorcerer in vocations.xml --
local druidvoc = 10   -- 10 number is the vocation id of a epic elder druid in vocations.xml --
local paladinvoc = 11 -- 11 number is the vocation id of a epic royal paladin in vocations.xml --
local knightvoc = 12  -- 12 number is the vocation id of an epic elite knight in vocations.xml --

local svoc = 1
local dvoc = 2
local pvoc = 3
local kvoc = 4

local outfitSorc = -- sorcerer new outfit after transformation --
{
lookType = 133,
lookHead = 19,
lookBody = 71,
lookLegs = 128,
lookFeet = 128,
lookAddons = 3
}

local outfitDruid = -- druid new outfit after transformation --
{
lookType = 264,
lookHead = 20,
lookBody = 30,
lookLegs = 40,
lookFeet = 50,
lookAddons = 3
}

local outfitPaladin = -- paladin new outfit after transformation --
{
lookType = 129,
lookHead = 95,
lookBody = 116,
lookLegs = 121,
lookFeet = 115,
lookAddons = 3
}


local outfitKnight = -- knight new outfit after transformation --
{
lookType = 255,
lookHead = 95,
lookBody = 95,
lookLegs = 95,
lookFeet = 95,
lookAddons = 3
}
 
-- warning do not modify these settings, unless you want to take mana from player --
local cointimeinterval = 1000 -- time interval (miliseconds) --
local numberofcoinused = 1 -- number of mana used or added up during time interval --
local coinneededtoexec = 150 -- number of mana needed to execute script, keep this setting this 0 --
local warnplaya = 1 -- warns player when runing out of mana, 1 = yes --
local numberofcointriggerwarn = 100 -- number of mana that triggers the warnings --

local sorcerfirsteffect = CONST_ME_ENERGYAREA
local sorcersecondeffect = CONST_ME_BLOCKHIT
local sorcerflingeffect = CONST_ANI_SMALLHOLY
local sorcerlandeffect = CONST_ME_TELEPORT
local sorcerringwaste = CONST_ME_FIREWORK_YELLOW
local sorcerringsorb = CONST_ME_FIREATTACK

local druidfirsteffect = CONST_ME_ICEATTACK
local druidsecondeffect = CONST_ME_ICETORNADO
local druidflingeffect = CONST_ME_ICEATTACK
local druidlandeffect = CONST_ME_GIANTICE
local druidringwaste = CONST_ME_FIREWORK_BLUE
local druidringsorb = CONST_ME_MAGIC_BLUE

local knightfirsteffect = CONST_ME_EXPLOSIONAREA
local knightsecondeffect = CONST_ME_FIREAREA
local knightflingeffect = CONST_ANI_FIRE
local knightlandeffect = CONST_ME_FIREWORK_RED
local knightringwaste = CONST_ME_FIREWORK_RED
local knightringsorb = CONST_ME_MAGIC_RED

local paladinfirsteffect = CONST_ME_YELLOW_RINGS
local paladinsecondeffect = CONST_ME_BLOCKHIT
local paladinflingeffect = CONST_ANI_SMALLHOLY
local paladinlandeffect = CONST_ME_HOLYAREA
local paladinringwaste = CONST_ME_FIREWORK_YELLOW
local paladinringsorb = CONST_ME_MAGIC_GREEN

-- skills of the sorcerer after transformation --
local sorcerercondition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(sorcerercondition, CONDITION_PARAM_TICKS, -1)            -- the -1 is to allow conditions to run forever -
setConditionParam(sorcerercondition, CONDITION_PARAM_SKILL_SHIELD, 5)     -- add 5 shielding to current shield skill --
setConditionParam(sorcerercondition, CONDITION_PARAM_STAT_MAGICPOINTS, 10) -- add 10 levels of magic to the player's current magic level --
setConditionParam(sorcerercondition, CONDITION_PARAM_STAT_MAXHITPOINTS, 40)  -- add 100 health to the player's current hp --
setConditionParam(sorcerercondition, CONDITION_PARAM_STAT_MAXMANAPOINTS, 100)   -- add 5000 mana to the players current mana --
-- skills of the druid after transformation --
local druidcondition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(druidcondition, CONDITION_PARAM_TICKS, -1)			   
setConditionParam(druidcondition, CONDITION_PARAM_SKILL_SHIELD, 5)
setConditionParam(druidcondition, CONDITION_PARAM_STAT_MAGICPOINTS, 10)
setConditionParam(druidcondition, CONDITION_PARAM_STAT_MAXHITPOINTS, 40)
setConditionParam(druidcondition, CONDITION_PARAM_STAT_MAXMANAPOINTS, 100)
-- skills of the paladin after transformation --
local paladincondition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(paladincondition, CONDITION_PARAM_TICKS, -1)
setConditionParam(paladincondition, CONDITION_PARAM_SKILL_DISTANCE, 10)
setConditionParam(paladincondition, CONDITION_PARAM_SKILL_SHIELD, 10)
setConditionParam(paladincondition, CONDITION_PARAM_STAT_MAGICPOINTS, 5)
setConditionParam(paladincondition, CONDITION_PARAM_STAT_MAXHITPOINTS, 150)
setConditionParam(paladincondition, CONDITION_PARAM_STAT_MAXMANAPOINTS, 80)
-- skills of the knight after transformation --
local knightcondition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(knightcondition, CONDITION_PARAM_TICKS, -1)
setConditionParam(knightcondition, CONDITION_PARAM_SKILL_FIST, 15)
setConditionParam(knightcondition, CONDITION_PARAM_SKILL_CLUB, 15)
setConditionParam(knightcondition, CONDITION_PARAM_SKILL_SWORD, 15)
setConditionParam(knightcondition, CONDITION_PARAM_SKILL_AXE, 15)
setConditionParam(knightcondition, CONDITION_PARAM_SKILL_SHIELD, 15)
setConditionParam(knightcondition, CONDITION_PARAM_STAT_MAGICPOINTS, 3)
setConditionParam(knightcondition, CONDITION_PARAM_STAT_MAXHITPOINTS, 200)
setConditionParam(knightcondition, CONDITION_PARAM_STAT_MAXMANAPOINTS, 50)
-- settings for health and mana regeneration per second --
local sorcererregen = createConditionObject(CONDITION_REGENERATION)
setConditionParam(sorcererregen, CONDITION_PARAM_TICKS, -1)
setConditionParam(sorcererregen, CONDITION_PARAM_HEALTHGAIN, 10) -- the players health will regenerate at 100 hp per second --
setConditionParam(sorcererregen, CONDITION_PARAM_MANAGAIN, 25)   -- the players mana will regenerate at 500 mana per second --

local druidregen = createConditionObject(CONDITION_REGENERATION)
setConditionParam(druidregen, CONDITION_PARAM_TICKS, -1)
setConditionParam(druidregen, CONDITION_PARAM_HEALTHGAIN, 10)
setConditionParam(druidregen, CONDITION_PARAM_MANAGAIN, 25)

local paladinregen = createConditionObject(CONDITION_REGENERATION)
setConditionParam(paladinregen, CONDITION_PARAM_TICKS, -1)
setConditionParam(paladinregen, CONDITION_PARAM_HEALTHGAIN, 15)
setConditionParam(paladinregen, CONDITION_PARAM_MANAGAIN, 15)

local knightregen = createConditionObject(CONDITION_REGENERATION)
setConditionParam(knightregen, CONDITION_PARAM_TICKS, -1)
setConditionParam(knightregen, CONDITION_PARAM_HEALTHGAIN, 25)
setConditionParam(knightregen, CONDITION_PARAM_MANAGAIN, 10)

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition2 = createConditionObject(CONDITION_HASTE) -- Auto super haste --
setConditionParam(condition2, CONDITION_PARAM_TICKS, -1)
setConditionFormula(condition2, 2.5, 0, 3.0, 0)
setCombatCondition(combat, condition2)

local condition3 = createConditionObject(CONDITION_MANASHIELD) -- Auto mana shield --
setConditionParam(condition3, CONDITION_PARAM_TICKS, -1)
setCombatCondition(combat, condition3)

events = {}

function superform1(param)
	if param.crca == 1 then
		local cointype = getPlayerMoney(param.cid)
		local pos = getCreaturePosition(param.cid)
		local voca = getPlayerVocation(param.cid)

		local nha = {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}
		local sha = {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}
		local wha = {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}
		local eha = {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}

		local nwa = {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}
		local nea = {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}
		local sea = {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}
		local swa = {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}

		if voca == 9 then
			doSendMagicEffect(pos, sorcerfirsteffect)
			doSendMagicEffect(pos, sorcersecondeffect)

			doSendDistanceShoot(pos, nha, sorcerflingeffect)
			doSendDistanceShoot(pos, sha, sorcerflingeffect)
			doSendDistanceShoot(pos, wha, sorcerflingeffect)
			doSendDistanceShoot(pos, eha, sorcerflingeffect)
			doSendDistanceShoot(pos, nwa, sorcerflingeffect)
			doSendDistanceShoot(pos, nea, sorcerflingeffect)
			doSendDistanceShoot(pos, sea, sorcerflingeffect)
			doSendDistanceShoot(pos, swa, sorcerflingeffect)

			doSendMagicEffect(nha, sorcerlandeffect)
			doSendMagicEffect(sha, sorcerlandeffect)
			doSendMagicEffect(wha, sorcerlandeffect)
			doSendMagicEffect(eha, sorcerlandeffect)
			doSendMagicEffect(nwa, sorcerlandeffect)
			doSendMagicEffect(nea, sorcerlandeffect)
			doSendMagicEffect(sea, sorcerlandeffect)
			doSendMagicEffect(swa, sorcerlandeffect)
			doSetCreatureOutfit(param.cid, outfitSorc, -1)
			doAddCondition(param.cid, sorcerercondition)
			doAddCondition(param.cid, condition3)
			doAddCondition(param.cid, sorcererregen)
		else if voca == 10 then
			doSendMagicEffect(pos, druidfirsteffect)
			doSendMagicEffect(pos, druidsecondeffect)

			doSendDistanceShoot(pos, nha, druidflingeffect)
			doSendDistanceShoot(pos, sha, druidflingeffect)
			doSendDistanceShoot(pos, wha, druidflingeffect)
			doSendDistanceShoot(pos, eha, druidflingeffect)
			doSendDistanceShoot(pos, nwa, druidflingeffect)
			doSendDistanceShoot(pos, nea, druidflingeffect)
			doSendDistanceShoot(pos, sea, druidflingeffect)
			doSendDistanceShoot(pos, swa, druidflingeffect)

			doSendMagicEffect(nha, druidlandeffect)
			doSendMagicEffect(sha, druidlandeffect)
			doSendMagicEffect(wha, druidlandeffect)
			doSendMagicEffect(eha, druidlandeffect)
			doSendMagicEffect(nwa, druidlandeffect)
			doSendMagicEffect(nea, druidlandeffect)
			doSendMagicEffect(sea, druidlandeffect)
			doSendMagicEffect(swa, druidlandeffect)
			doSetCreatureOutfit(param.cid, outfitDruid, -1)
			doAddCondition(param.cid, druidcondition)
			doAddCondition(param.cid, condition3)
			doAddCondition(param.cid, druidregen)
		else if voca == 11 then
			doSendMagicEffect(pos, paladinfirsteffect)
			doSendMagicEffect(pos, paladinsecondeffect)

			doSendDistanceShoot(pos, nha, paladinflingeffect)
			doSendDistanceShoot(pos, sha, paladinflingeffect)
			doSendDistanceShoot(pos, wha, paladinflingeffect)
			doSendDistanceShoot(pos, eha, paladinflingeffect)
			doSendDistanceShoot(pos, nwa, paladinflingeffect)
			doSendDistanceShoot(pos, nea, paladinflingeffect)
			doSendDistanceShoot(pos, sea, paladinflingeffect)
			doSendDistanceShoot(pos, swa, paladinflingeffect)

			doSendMagicEffect(nha, paladinlandeffect)
			doSendMagicEffect(sha, paladinlandeffect)
			doSendMagicEffect(wha, paladinlandeffect)
			doSendMagicEffect(eha, paladinlandeffect)
			doSendMagicEffect(nwa, paladinlandeffect)
			doSendMagicEffect(nea, paladinlandeffect)
			doSendMagicEffect(sea, paladinlandeffect)
			doSendMagicEffect(swa, paladinlandeffect) 
			doSetCreatureOutfit(param.cid, outfitPaladin, -1)
			doAddCondition(param.cid, paladincondition)
			doAddCondition(param.cid, paladinregen)
		else if voca == 12 then
			doSendMagicEffect(pos, knightfirsteffect)
			doSendMagicEffect(pos, knightsecondeffect)

			doSendDistanceShoot(pos, nha, knightflingeffect)
			doSendDistanceShoot(pos, sha, knightflingeffect)
			doSendDistanceShoot(pos, wha, knightflingeffect)
			doSendDistanceShoot(pos, eha, knightflingeffect)
			doSendDistanceShoot(pos, nwa, knightflingeffect)
			doSendDistanceShoot(pos, nea, knightflingeffect)
			doSendDistanceShoot(pos, sea, knightflingeffect)
			doSendDistanceShoot(pos, swa, knightflingeffect)

			doSendMagicEffect(nha, knightlandeffect)
			doSendMagicEffect(sha, knightlandeffect)
			doSendMagicEffect(wha, knightlandeffect)
			doSendMagicEffect(eha, knightlandeffect)
			doSendMagicEffect(nwa, knightlandeffect)
			doSendMagicEffect(nea, knightlandeffect)
			doSendMagicEffect(sea, knightlandeffect)
			doSendMagicEffect(swa, knightlandeffect) 
			doSetCreatureOutfit(param.cid, outfitKnight, -1)
			doAddCondition(param.cid, knightcondition)
			doAddCondition(param.cid, knightregen)
		end
		end
		end
		end
		doAddCondition(param.cid, condition2)                 -- add super haste to all new vocations --
		if(os.time() > getPlayerStorageValue(param.cid, exh_storageadd)) then
			local mhp = getCreatureMaxHealth(param.cid)
			local mma = getPlayerMaxMana(param.cid)
			local chp = getCreatureHealth(param.cid)
			local cma = getPlayerMana(param.cid)

			local dhp = mhp - chp
			local dma = mma - cma
			param.cid:addHealth(dhp)-- doCreatureAddHealth(param.cid, dhp)
			param.cid:addMana(dma)-- doPlayerAddMana(param.cid, dma)
			setPlayerStorageValue(param.cid, exh_storageadd, os.time() + exh_secondsadd) 
		end
		param.crcb = 1
		param.voca = voca
		setPlayerStorageValue(param.cid, check, 1)
		addEvent(superform2, 1, param)
	end
end

function superform2(param)
	if param.crca == 1 and param.crcb == 1 and isCreature(param.cid) == true and getPlayerStorageValue(param.cid, check) == 1 then
		local pos = getCreaturePosition(param.cid)
		doPlayerRemoveMoney(param.cid, numberofcoinused)

		if param.voca == 9 then 
			doSendMagicEffect(pos, sorcerringwaste)
			doSendMagicEffect(pos, sorcerringsorb)
		else if param.voca == 10 then 
			doSendMagicEffect(pos, druidringwaste)
			doSendMagicEffect(pos, druidringsorb)
		else if param.voca == 11 then 
			doSendMagicEffect(pos, paladinringwaste)
			doSendMagicEffect(pos, paladinringsorb)
		else if param.voca == 12 then 
			doSendMagicEffect(pos, knightringwaste)
			doSendMagicEffect(pos, knightringsorb)
		end
		end
		end
		end
		local coinleft = getPlayerMoney(param.cid)
		if coinleft < numberofcointriggerwarn then 
			doPlayerSendCancel(param.cid, 'You have only '.. coinleft ..' your epic transform will be removed!')
		end
		if coinleft < numberofcoinused then 
			param.crca = 0
			param.crcb = 0
			setPlayerStorageValue(param.cid, check, 0)
			setPlayerStorageValue(param.cid, storageadd, 0)

			local pos = getCreaturePosition(param.cid)

			local nha = {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}
			local sha = {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}
			local wha = {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}
			local eha = {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}

			local nwa = {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}
			local nea = {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}
			local sea = {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}
			local swa = {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}

			-- removes the outfit, attributes, super haste, mana shield, hp/mp regeneration --
			doRemoveCondition(param.cid, CONDITION_OUTFIT) 
			doRemoveCondition(param.cid, CONDITION_ATTRIBUTES)
			doRemoveCondition(param.cid, CONDITION_HASTE)
			doRemoveCondition(param.cid, CONDITION_MANASHIELD)
			doRemoveCondition(param.cid, CONDITION_REGENERATION)

		if (isPlayer(param.cid) == FALSE) then
			param.crca = 0
			param.crcb = 0
			setPlayerStorageValue(param.cid, check, 0)
			setPlayerStorageValue(param.cid, storageadd, 0)
		end

		if param.voca == 9 then
			doSendMagicEffect(pos, sorcerfirsteffect)
			doSendMagicEffect(pos, sorcersecondeffect)

			doSendDistanceShoot(pos, nha, sorcerflingeffect)
			doSendDistanceShoot(pos, sha, sorcerflingeffect)
			doSendDistanceShoot(pos, wha, sorcerflingeffect)
			doSendDistanceShoot(pos, eha, sorcerflingeffect)
			doSendDistanceShoot(pos, nwa, sorcerflingeffect)
			doSendDistanceShoot(pos, nea, sorcerflingeffect)
			doSendDistanceShoot(pos, sea, sorcerflingeffect)
			doSendDistanceShoot(pos, swa, sorcerflingeffect)

			doSendMagicEffect(nha, sorcerlandeffect)
			doSendMagicEffect(sha, sorcerlandeffect)
			doSendMagicEffect(wha, sorcerlandeffect)
			doSendMagicEffect(eha, sorcerlandeffect)
			doSendMagicEffect(nwa, sorcerlandeffect)
			doSendMagicEffect(nea, sorcerlandeffect)
			doSendMagicEffect(sea, sorcerlandeffect)
			doSendMagicEffect(swa, sorcerlandeffect)
		else if param.voca == 10 then
			doSendMagicEffect(pos, druidfirsteffect)
			doSendMagicEffect(pos, druidsecondeffect)

			doSendDistanceShoot(pos, nha, druidflingeffect)
			doSendDistanceShoot(pos, sha, druidflingeffect)
			doSendDistanceShoot(pos, wha, druidflingeffect)
			doSendDistanceShoot(pos, eha, druidflingeffect)
			doSendDistanceShoot(pos, nwa, druidflingeffect)
			doSendDistanceShoot(pos, nea, druidflingeffect)
			doSendDistanceShoot(pos, sea, druidflingeffect)
			doSendDistanceShoot(pos, swa, druidflingeffect)

			doSendMagicEffect(nha, druidlandeffect)
			doSendMagicEffect(sha, druidlandeffect)
			doSendMagicEffect(wha, druidlandeffect)
			doSendMagicEffect(eha, druidlandeffect)
			doSendMagicEffect(nwa, druidlandeffect)
			doSendMagicEffect(nea, druidlandeffect)
			doSendMagicEffect(sea, druidlandeffect)
			doSendMagicEffect(swa, druidlandeffect)
		else if param.voca == 11 then
			doSendMagicEffect(pos, paladinfirsteffect)
			doSendMagicEffect(pos, paladinsecondeffect)

			doSendDistanceShoot(pos, nha, paladinflingeffect)
			doSendDistanceShoot(pos, sha, paladinflingeffect)
			doSendDistanceShoot(pos, wha, paladinflingeffect)
			doSendDistanceShoot(pos, eha, paladinflingeffect)
			doSendDistanceShoot(pos, nwa, paladinflingeffect)
			doSendDistanceShoot(pos, nea, paladinflingeffect)
			doSendDistanceShoot(pos, sea, paladinflingeffect)
			doSendDistanceShoot(pos, swa, paladinflingeffect)

			doSendMagicEffect(nha, paladinlandeffect)
			doSendMagicEffect(sha, paladinlandeffect)
			doSendMagicEffect(wha, paladinlandeffect)
			doSendMagicEffect(eha, paladinlandeffect)
			doSendMagicEffect(nwa, paladinlandeffect)
			doSendMagicEffect(nea, paladinlandeffect)
			doSendMagicEffect(sea, paladinlandeffect)
			doSendMagicEffect(swa, paladinlandeffect)
		else if param.voca == 12 then
			doSendMagicEffect(pos, knightfirsteffect)
			doSendMagicEffect(pos, knightsecondeffect)

			doSendDistanceShoot(pos, nha, knightflingeffect)
			doSendDistanceShoot(pos, sha, knightflingeffect)
			doSendDistanceShoot(pos, wha, knightflingeffect)
			doSendDistanceShoot(pos, eha, knightflingeffect)
			doSendDistanceShoot(pos, nwa, knightflingeffect)
			doSendDistanceShoot(pos, nea, knightflingeffect)
			doSendDistanceShoot(pos, sea, knightflingeffect)
			doSendDistanceShoot(pos, swa, knightflingeffect)

			doSendMagicEffect(nha, knightlandeffect)
			doSendMagicEffect(sha, knightlandeffect)
			doSendMagicEffect(wha, knightlandeffect)
			doSendMagicEffect(eha, knightlandeffect)
			doSendMagicEffect(nwa, knightlandeffect)
			doSendMagicEffect(nea, knightlandeffect)
			doSendMagicEffect(sea, knightlandeffect)
			doSendMagicEffect(swa, knightlandeffect)
		end
		end
		end
		end
		else
			addEvent(superform2, cointimeinterval, param)
		end

	end
end

local epiceq = MoveEvent()

function epiceq.onEquip(cid, item, slot, isCheck)
	local param = {cid = cid, item = item, slot = slot}
	local tempvoc = getPlayerVocation(cid)
	local promotion = cid:getVocation(id)
	local currentcoin = getPlayerMoney(cid)
	setPlayerStorageValue(cid, storageadd, 1)
	setPlayerStorageValue(cid, storage, tempvoc)
	setPlayerStorageValue(cid, prostorage, getPlayerVocation(cid))
	if currentcoin <= coinneededtoexec then
		doPlayerSendCancel(cid, 'You have not enough money!')
		if getPlayerVocation(cid) == 9 then
			doPlayerSetVocation(cid, 5)
		elseif getPlayerVocation(cid) == 10 then
     			doPlayerSetVocation(cid, 6)
		elseif getPlayerVocation(cid) == 11 then
     			doPlayerSetVocation(cid, 7)
		elseif getPlayerVocation(cid) == 12 then
     			doPlayerSetVocation(cid, 8)
		end
	end	 
	local pos = getPlayerPosition(cid)
	if(os.time() > getPlayerStorageValue(cid, exh_storageadd)) then
		if (tempvoc == 1 or tempvoc == 5) then
			doPlayerSetVocation(cid, sorcerervoc)
		elseif (tempvoc == 2 or tempvoc == 6) then
     			doPlayerSetVocation(cid, druidvoc)
		elseif (tempvoc == 3 or tempvoc == 7) then
     			doPlayerSetVocation(cid, paladinvoc)
		elseif (tempvoc == 4 or tempvoc == 8) then
     			doPlayerSetVocation(cid, knightvoc)
		end
		doCreatureSay(cid, "Rutilus Vox", MESSAGE_POTION)
		param.crca = 1
		events[getPlayerGUID(cid)] = addEvent(superform1, 1, param)
	else
		local time = getPlayerStorageValue(cid, exh_storageadd) - os.time()
		doPlayerSendCancel(cid, 'You cannot use this ring within one minute! It\'s still '.. time ..' seconds!')
		if getPlayerVocation(cid) == 9 then
			doPlayerSetVocation(cid, 5)
		elseif getPlayerVocation(cid) == 10 then
     			doPlayerSetVocation(cid, 6)
		elseif getPlayerVocation(cid) == 11 then
     			doPlayerSetVocation(cid, 7)
		elseif getPlayerVocation(cid) == 12 then
     			doPlayerSetVocation(cid, 8)
		end
	end
	return true
end
epiceq:type("equip")
epiceq:slot("ring")
epiceq:id(31557)
epiceq:register()

local epicdeeq = MoveEvent()

function epicdeeq.onDeEquip(cid, item, slot, isCheck)
	if isPlayer(cid) and getPlayerStorageValue(cid, check) == 1 then
		local promotion = cid:getVocation():getPromotion()
		local old = getPlayerStorageValue(cid, storage)
		setPlayerStorageValue(cid, storageadd, 0)
		local temptwo = getPlayerVocation(cid)
		if temptwo == 9 then
			doPlayerSetVocation(cid, 5)
		elseif temptwo == 10 then
			doPlayerSetVocation(cid, 6)
		elseif temptwo == 11 then
			doPlayerSetVocation(cid, 7)
		elseif temptwo == 12 then
			doPlayerSetVocation(cid, 8)
		end
		doRemoveCondition(cid, CONDITION_OUTFIT) 
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		doRemoveCondition(cid, CONDITION_HASTE)
		doRemoveCondition(cid, CONDITION_MANASHIELD)
		doRemoveCondition(cid, CONDITION_REGENERATION)

		local pos = getCreaturePosition(cid)
		doCreatureSay(cid, "Aufero Meus Donum", MESSAGE_POTION)
		setPlayerStorageValue(cid, check, 0)
		
		local voca = getPlayerVocation(cid) 

		local nha = {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}
		local sha = {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}
		local wha = {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}
		local eha = {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}

		local nwa = {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}
		local nea = {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}
		local sea = {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}
		local swa = {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}

		if voca == 1 or voca == 5 then
			doSendMagicEffect(pos, sorcerfirsteffect)
			doSendMagicEffect(pos, sorcersecondeffect)

			doSendDistanceShoot(pos, nha, sorcerflingeffect)
			doSendDistanceShoot(pos, sha, sorcerflingeffect)
			doSendDistanceShoot(pos, wha, sorcerflingeffect)
			doSendDistanceShoot(pos, eha, sorcerflingeffect)
			doSendDistanceShoot(pos, nwa, sorcerflingeffect)
			doSendDistanceShoot(pos, nea, sorcerflingeffect)
			doSendDistanceShoot(pos, sea, sorcerflingeffect)
			doSendDistanceShoot(pos, swa, sorcerflingeffect)

			doSendMagicEffect(nha, sorcerlandeffect)
			doSendMagicEffect(sha, sorcerlandeffect)
			doSendMagicEffect(wha, sorcerlandeffect)
			doSendMagicEffect(eha, sorcerlandeffect)
			doSendMagicEffect(nwa, sorcerlandeffect)
			doSendMagicEffect(nea, sorcerlandeffect)
			doSendMagicEffect(sea, sorcerlandeffect)
			doSendMagicEffect(swa, sorcerlandeffect)

		elseif voca == 2 or voca == 6 then
			doSendMagicEffect(pos, druidfirsteffect)
			doSendMagicEffect(pos, druidsecondeffect)

			doSendDistanceShoot(pos, nha, druidflingeffect)
			doSendDistanceShoot(pos, sha, druidflingeffect)
			doSendDistanceShoot(pos, wha, druidflingeffect)
			doSendDistanceShoot(pos, eha, druidflingeffect)
			doSendDistanceShoot(pos, nwa, druidflingeffect)
			doSendDistanceShoot(pos, nea, druidflingeffect)
			doSendDistanceShoot(pos, sea, druidflingeffect)
			doSendDistanceShoot(pos, swa, druidflingeffect)

			doSendMagicEffect(nha, druidlandeffect)
			doSendMagicEffect(sha, druidlandeffect)
			doSendMagicEffect(wha, druidlandeffect)
			doSendMagicEffect(eha, druidlandeffect)
			doSendMagicEffect(nwa, druidlandeffect)
			doSendMagicEffect(nea, druidlandeffect)
			doSendMagicEffect(sea, druidlandeffect)
			doSendMagicEffect(swa, druidlandeffect)

		elseif voca == 3 or voca == 7 then
			doSendMagicEffect(pos, paladinfirsteffect)
			doSendMagicEffect(pos, paladinsecondeffect)

			doSendDistanceShoot(pos, nha, paladinflingeffect)
			doSendDistanceShoot(pos, sha, paladinflingeffect)
			doSendDistanceShoot(pos, wha, paladinflingeffect)
			doSendDistanceShoot(pos, eha, paladinflingeffect)
			doSendDistanceShoot(pos, nwa, paladinflingeffect)
			doSendDistanceShoot(pos, nea, paladinflingeffect)
			doSendDistanceShoot(pos, sea, paladinflingeffect)
			doSendDistanceShoot(pos, swa, paladinflingeffect)

			doSendMagicEffect(nha, paladinlandeffect)
			doSendMagicEffect(sha, paladinlandeffect)
			doSendMagicEffect(wha, paladinlandeffect)
			doSendMagicEffect(eha, paladinlandeffect)
			doSendMagicEffect(nwa, paladinlandeffect)
			doSendMagicEffect(nea, paladinlandeffect)
			doSendMagicEffect(sea, paladinlandeffect)
			doSendMagicEffect(swa, paladinlandeffect)

		elseif voca == 4 or voca == 8 then
			doSendMagicEffect(pos, knightfirsteffect)
			doSendMagicEffect(pos, knightsecondeffect)

			doSendDistanceShoot(pos, nha, knightflingeffect)
			doSendDistanceShoot(pos, sha, knightflingeffect)
			doSendDistanceShoot(pos, wha, knightflingeffect)
			doSendDistanceShoot(pos, eha, knightflingeffect)
			doSendDistanceShoot(pos, nwa, knightflingeffect)
			doSendDistanceShoot(pos, nea, knightflingeffect)
			doSendDistanceShoot(pos, sea, knightflingeffect)
			doSendDistanceShoot(pos, swa, knightflingeffect)

			doSendMagicEffect(nha, knightlandeffect)
			doSendMagicEffect(sha, knightlandeffect)
			doSendMagicEffect(wha, knightlandeffect)
			doSendMagicEffect(eha, knightlandeffect)
			doSendMagicEffect(nwa, knightlandeffect)
			doSendMagicEffect(nea, knightlandeffect)
			doSendMagicEffect(sea, knightlandeffect)
			doSendMagicEffect(swa, knightlandeffect)
		end
	end
	events[getPlayerGUID(cid)] = stopEvent(superform1)
	return true
end
epicdeeq:type("deequip")
epicdeeq:slot("ring")
epicdeeq:id(31616)
epicdeeq:register()
