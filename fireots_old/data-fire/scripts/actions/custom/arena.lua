local setting = {
	centerRoom = { x = 82, y = 2078, z = 8 },
	range = 8,
}

local playerPositions = {
	{ fromPos = { x = 81, y = 2070, z = 8 }, toPos = { x = 78, y = 2075, z = 8 } }, -- Player 2
	{ fromPos = { x = 83, y = 2070, z = 8 }, toPos = { x = 86, y = 2075, z = 8 } }, -- Player 1
}

local positions = {}
local arena = Action()

function arena.onUse(player, item, fromPosition, target, toPosition, monster, isHotkey)
	if toPosition == Position(82, 2070, 8) and item.uid == 2217 and item.itemid == 1945 then
		if roomIsOccupied(setting.centerRoom, false, setting.range, setting.range) then
			player:say("Please wait for the fighters come out of the arena.", TALKTYPE_MONSTER_SAY)
			return true
		end
		for i = 1, #playerPositions do
			local creature = Tile(playerPositions[i].fromPos):getTopCreature()
			if creature and creature:getPlayer() then
				creature:teleportTo(playerPositions[i].toPos)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			elseif not creature then
				player:say("You need 2 players for enter in the arena.", TALKTYPE_MONSTER_SAY)
				return true
			else
				player:say("You need 2 players for enter in the arena.", TALKTYPE_MONSTER_SAY)
				return true
			end
		end
	else
		return false
	end
	return true
end
arena:uid(2217)
arena:register()
