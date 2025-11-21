local setting = {
	centerRoom = { x = 1046, y = 988, z = 9 },
	range = 10,
}

local playerPositions = {
	{ fromPos = { x = 1040, y = 987, z = 8 }, toPos = { x = 1041, y = 988, z = 9 } }, -- Player 2
	{ fromPos = { x = 1040, y = 989, z = 8 }, toPos = { x = 1052, y = 988, z = 9 } }, -- Player 1
}

local positions = {}
local arenalever = Action()

function arenalever.onUse(player, item, fromPosition, target, toPosition, monster, isHotkey)
	if toPosition == Position(1040, 988, 8) and item.uid == 7001 and item.itemid == 1945 then
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
arenalever:uid(7001)
arenalever:register()
