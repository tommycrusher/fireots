-- Ring Death - Reverts epic vocation on death
-- Prevents players from dying with epic vocation (9-12) and losing XP as epic class

local EPIC_TO_PROMOTED = {
	[9] = 5,  -- Wizzard -> Master Sorcerer
	[10] = 6, -- Ent -> Elder Druid
	[11] = 7, -- Robin Hood -> Royal Paladin
	[12] = 8  -- Lancelot -> Elite Knight
}

local ringDeath = CreatureEvent("RingDeath")

function ringDeath.onPrepareDeath(player, lastHitKiller, mostDamageKiller)
	if not player then
		return true
	end

	-- Revert epic vocation to promoted before death
	local currentVoc = player:getVocation():getId()
	local promotedVoc = EPIC_TO_PROMOTED[currentVoc]

	if promotedVoc then
		player:setVocation(promotedVoc)

		-- Clear epic ring storages
		player:setStorageValue(18011, 0) -- ACTIVE
		player:setStorageValue(18012, 0) -- CHECK
	end

	return true
end

ringDeath:register()
