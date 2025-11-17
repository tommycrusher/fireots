-- Ring Check - Ensures epic vocations revert when ring is removed
-- Prevents players from keeping epic vocation (9-12) without ring equipped

local EPIC_TO_PROMOTED = {
	[9] = 5,  -- Wizzard -> Master Sorcerer
	[10] = 6, -- Ent -> Elder Druid
	[11] = 7, -- Robin Hood -> Royal Paladin
	[12] = 8  -- Lancelot -> Elite Knight
}

local STORAGE_CHECK = 18012

local ringCheck = CreatureEvent("RingCheck")

function ringCheck.onThink(player, interval)
	if not player then
		return true
	end

	-- If ring is not active (storage < 1), revert epic vocation
	if player:getStorageValue(STORAGE_CHECK) < 1 then
		local currentVoc = player:getVocation():getId()
		local promotedVoc = EPIC_TO_PROMOTED[currentVoc]

		if promotedVoc then
			player:setVocation(promotedVoc)
		end
	end

	return true
end

-- Disabled by default - use epic_modernized.lua instead
-- ringCheck:interval(1000)
ringCheck:register()
