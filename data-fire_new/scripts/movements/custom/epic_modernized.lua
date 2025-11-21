-- Epic Ring System - Modernized with Premium Check
-- Transforms players into epic vocations (9-12) with enhanced stats
-- REQUIRES PREMIUM ACCOUNT - prevents free access to epic transformations
-- Item ID: 31557 (epic ring equipped), 31616 (epic ring unequipped)

-- Storage values
local STORAGE = {
	VOCATION = 18009,      -- Original vocation before transformation
	PROMOTION = 18010,     -- Promotion status
	ACTIVE = 18011,        -- Ring active status
	CHECK = 18012,         -- Transformation check
	EXHAUSTED = 18013      -- Exhausted timer
}

-- Configuration
local CONFIG = {
	exhaustedSeconds = 20,
	coinInterval = 1000,        -- Money drain interval (ms)
	coinUsedPerTick = 1,        -- Money consumed per tick
	coinNeeded = 150,           -- Minimum money to activate
	coinWarningThreshold = 100  -- Warning threshold
}

-- Epic vocation IDs (from vocations.xml)
local EPIC_VOCATIONS = {
	SORCERER = 9,   -- Wizzard
	DRUID = 10,     -- Ent
	PALADIN = 11,   -- Robin Hood
	KNIGHT = 12     -- Lancelot
}

-- Vocation mapping: base/promoted -> epic
local VOCATION_MAP = {
	[1] = EPIC_VOCATIONS.SORCERER, -- Sorcerer -> Wizzard
	[5] = EPIC_VOCATIONS.SORCERER, -- Master Sorcerer -> Wizzard
	[2] = EPIC_VOCATIONS.DRUID,    -- Druid -> Ent
	[6] = EPIC_VOCATIONS.DRUID,    -- Elder Druid -> Ent
	[3] = EPIC_VOCATIONS.PALADIN,  -- Paladin -> Robin Hood
	[7] = EPIC_VOCATIONS.PALADIN,  -- Royal Paladin -> Robin Hood
	[4] = EPIC_VOCATIONS.KNIGHT,   -- Knight -> Lancelot
	[8] = EPIC_VOCATIONS.KNIGHT    -- Elite Knight -> Lancelot
}

-- Reverse mapping: epic -> promoted
local PROMOTED_VOCATIONS = {
	[EPIC_VOCATIONS.SORCERER] = 5, -- Wizzard -> Master Sorcerer
	[EPIC_VOCATIONS.DRUID] = 6,    -- Ent -> Elder Druid
	[EPIC_VOCATIONS.PALADIN] = 7,  -- Robin Hood -> Royal Paladin
	[EPIC_VOCATIONS.KNIGHT] = 8    -- Lancelot -> Elite Knight
}

-- Outfits for each epic vocation
local OUTFITS = {
	[EPIC_VOCATIONS.SORCERER] = {lookType = 133, lookHead = 19, lookBody = 71, lookLegs = 128, lookFeet = 128, lookAddons = 3},
	[EPIC_VOCATIONS.DRUID] = {lookType = 264, lookHead = 20, lookBody = 30, lookLegs = 40, lookFeet = 50, lookAddons = 3},
	[EPIC_VOCATIONS.PALADIN] = {lookType = 129, lookHead = 95, lookBody = 116, lookLegs = 121, lookFeet = 115, lookAddons = 3},
	[EPIC_VOCATIONS.KNIGHT] = {lookType = 255, lookHead = 95, lookBody = 95, lookLegs = 95, lookFeet = 95, lookAddons = 3}
}

-- Visual effects per vocation
local EFFECTS = {
	[EPIC_VOCATIONS.SORCERER] = {
		first = CONST_ME_ENERGYAREA,
		second = CONST_ME_BLOCKHIT,
		projectile = CONST_ANI_SMALLHOLY,
		land = CONST_ME_TELEPORT,
		waste = CONST_ME_FIREWORK_YELLOW,
		orb = CONST_ME_FIREATTACK
	},
	[EPIC_VOCATIONS.DRUID] = {
		first = CONST_ME_ICEATTACK,
		second = CONST_ME_ICETORNADO,
		projectile = CONST_ME_ICEATTACK,
		land = CONST_ME_GIANTICE,
		waste = CONST_ME_FIREWORK_BLUE,
		orb = CONST_ME_MAGIC_BLUE
	},
	[EPIC_VOCATIONS.PALADIN] = {
		first = CONST_ME_YELLOW_RINGS,
		second = CONST_ME_BLOCKHIT,
		projectile = CONST_ANI_SMALLHOLY,
		land = CONST_ME_HOLYAREA,
		waste = CONST_ME_FIREWORK_YELLOW,
		orb = CONST_ME_MAGIC_GREEN
	},
	[EPIC_VOCATIONS.KNIGHT] = {
		first = CONST_ME_EXPLOSIONAREA,
		second = CONST_ME_FIREAREA,
		projectile = CONST_ANI_FIRE,
		land = CONST_ME_FIREWORK_RED,
		waste = CONST_ME_FIREWORK_RED,
		orb = CONST_ME_MAGIC_RED
	}
}

-- Stat conditions per vocation
local function createVocationCondition(epicVocId)
	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_TICKS, -1) -- Permanent while equipped

	if epicVocId == EPIC_VOCATIONS.SORCERER or epicVocId == EPIC_VOCATIONS.DRUID then
		condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, 5)
		condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 10)
		condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 40)
		condition:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 100)
	elseif epicVocId == EPIC_VOCATIONS.PALADIN then
		condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)
		condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, 10)
		condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 5)
		condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 150)
		condition:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 80)
	elseif epicVocId == EPIC_VOCATIONS.KNIGHT then
		condition:setParameter(CONDITION_PARAM_SKILL_FIST, 15)
		condition:setParameter(CONDITION_PARAM_SKILL_CLUB, 15)
		condition:setParameter(CONDITION_PARAM_SKILL_SWORD, 15)
		condition:setParameter(CONDITION_PARAM_SKILL_AXE, 15)
		condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, 15)
		condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
		condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 200)
		condition:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 50)
	end

	return condition
end

-- Regeneration conditions per vocation
local function createRegenCondition(epicVocId)
	local condition = Condition(CONDITION_REGENERATION)
	condition:setParameter(CONDITION_PARAM_TICKS, -1)

	if epicVocId == EPIC_VOCATIONS.SORCERER or epicVocId == EPIC_VOCATIONS.DRUID then
		condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 10)
		condition:setParameter(CONDITION_PARAM_MANAGAIN, 25)
	elseif epicVocId == EPIC_VOCATIONS.PALADIN then
		condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 15)
		condition:setParameter(CONDITION_PARAM_MANAGAIN, 15)
	elseif epicVocId == EPIC_VOCATIONS.KNIGHT then
		condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 25)
		condition:setParameter(CONDITION_PARAM_MANAGAIN, 10)
	end

	return condition
end

-- Haste condition (all vocations)
local function createHasteCondition()
	local condition = Condition(CONDITION_HASTE)
	condition:setParameter(CONDITION_PARAM_TICKS, -1)
	condition:setFormula(2.5, 0, 3.0, 0)
	return condition
end

-- Mana shield condition (mages only)
local function createManaShieldCondition()
	local condition = Condition(CONDITION_MANASHIELD)
	condition:setParameter(CONDITION_PARAM_TICKS, -1)
	return condition
end

-- Send transformation effects
local function sendTransformationEffects(player, epicVocId)
	local pos = player:getPosition()
	local fx = EFFECTS[epicVocId]

	if not fx then
		return
	end

	-- Center effects
	pos:sendMagicEffect(fx.first)
	pos:sendMagicEffect(fx.second)

	-- Radial projectiles and effects
	local offsets = {
		{0, -3}, {0, 3}, {-3, 0}, {3, 0},  -- Cardinal directions
		{-2, -2}, {2, -2}, {2, 2}, {-2, 2} -- Diagonals
	}

	for _, offset in ipairs(offsets) do
		local targetPos = Position(pos.x + offset[1], pos.y + offset[2], pos.z)
		pos:sendDistanceEffect(targetPos, fx.projectile)
		targetPos:sendMagicEffect(fx.land)
	end
end

-- Send active ring effects (periodic)
local function sendActiveRingEffects(player, epicVocId)
	local pos = player:getPosition()
	local fx = EFFECTS[epicVocId]

	if fx then
		pos:sendMagicEffect(fx.waste)
		pos:sendMagicEffect(fx.orb)
	end
end

-- Apply epic transformation
local function applyEpicTransformation(player, epicVocId)
	-- Save original vocation
	player:setStorageValue(STORAGE.VOCATION, player:getVocation():getId())

	-- Transform to epic vocation
	player:setVocation(epicVocId)

	-- Apply outfit
	if OUTFITS[epicVocId] then
		player:setOutfit(OUTFITS[epicVocId], -1)
	end

	-- Apply conditions
	player:addCondition(createVocationCondition(epicVocId))
	player:addCondition(createRegenCondition(epicVocId))
	player:addCondition(createHasteCondition())

	-- Mana shield for mages only
	if epicVocId == EPIC_VOCATIONS.SORCERER or epicVocId == EPIC_VOCATIONS.DRUID then
		player:addCondition(createManaShieldCondition())
	end

	-- Full heal on transformation
	player:addHealth(player:getMaxHealth() - player:getHealth())
	player:addMana(player:getMaxMana() - player:getMana())

	-- Visual effects
	sendTransformationEffects(player, epicVocId)

	-- Mark as active
	player:setStorageValue(STORAGE.ACTIVE, 1)
	player:setStorageValue(STORAGE.CHECK, 1)
	player:setStorageValue(STORAGE.EXHAUSTED, os.time() + CONFIG.exhaustedSeconds)

	player:say("Rutilus Vox", TALKTYPE_MONSTER_SAY)
end

-- Remove epic transformation
local function removeEpicTransformation(player, showEffects)
	local epicVocId = player:getVocation():getId()
	local promotedVoc = PROMOTED_VOCATIONS[epicVocId]

	if not promotedVoc then
		return false
	end

	-- Revert to promoted vocation
	player:setVocation(promotedVoc)

	-- Remove conditions
	player:removeCondition(CONDITION_OUTFIT)
	player:removeCondition(CONDITION_ATTRIBUTES)
	player:removeCondition(CONDITION_HASTE)
	player:removeCondition(CONDITION_MANASHIELD)
	player:removeCondition(CONDITION_REGENERATION)

	-- Clear storages
	player:setStorageValue(STORAGE.ACTIVE, 0)
	player:setStorageValue(STORAGE.CHECK, 0)

	if showEffects then
		sendTransformationEffects(player, epicVocId)
		player:say("Aufero Meus Donum", TALKTYPE_MONSTER_SAY)
	end

	return true
end

-- Money drain loop
local function moneyDrainLoop(playerId, epicVocId)
	local player = Player(playerId)

	if not player or player:getStorageValue(STORAGE.CHECK) ~= 1 then
		return
	end

	-- Check money
	local money = player:getMoney()

	if money < CONFIG.coinWarningThreshold then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format("Warning: Only %d gold left! Epic transform will end soon!", money))
	end

	if money < CONFIG.coinUsedPerTick then
		-- Out of money - remove transformation
		removeEpicTransformation(player, true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your epic transformation has ended - not enough gold!")
		return
	end

	-- Drain money
	player:removeMoney(CONFIG.coinUsedPerTick)

	-- Visual effects
	sendActiveRingEffects(player, epicVocId)

	-- Schedule next tick
	addEvent(moneyDrainLoop, CONFIG.coinInterval, playerId, epicVocId)
end

-- Equipment event: Epic Ring Equip
local epiceq = MoveEvent()

function epiceq.onEquip(player, item, slot, isCheck)
	if not player:isPremium() then
		player:sendCancelMessage("You need a premium account to use the Epic Ring!")
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Epic Ring requires premium account.")
		return false
	end

	local currentVoc = player:getVocation():getId()
	local epicVocId = VOCATION_MAP[currentVoc]

	if not epicVocId then
		player:sendCancelMessage("Your vocation cannot use the Epic Ring!")
		return false
	end

	-- Check money
	if player:getMoney() < CONFIG.coinNeeded then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You need at least %d gold to activate Epic Ring!", CONFIG.coinNeeded))
		return false
	end

	-- Check exhaustion
	local exhausted = player:getStorageValue(STORAGE.EXHAUSTED)
	if exhausted > os.time() then
		local timeLeft = exhausted - os.time()
		player:sendTextMessage(MESSAGE_STATUS_SMALL, string.format("Epic Ring exhausted for %d seconds.", timeLeft))
		return false
	end

	-- Apply transformation
	applyEpicTransformation(player, epicVocId)

	-- Start money drain loop
	addEvent(moneyDrainLoop, CONFIG.coinInterval, player:getId(), epicVocId)

	return true
end

epiceq:type("equip")
epiceq:slot("ring")
epiceq:id(31557)
epiceq:register()

-- Equipment event: Epic Ring De-equip
local epicdeeq = MoveEvent()

function epicdeeq.onDeEquip(player, item, slot, isCheck)
	removeEpicTransformation(player, true)
	return true
end

epicdeeq:type("deequip")
epicdeeq:slot("ring")
epicdeeq:id(31616)
epicdeeq:register()
