local ringCheck = GlobalEvent("RingCheck")

function ringCheck.onThink(interval)
local players = Game.getPlayers()
	if players == true then
		for _, player in ipairs(players) do 
			if getPlayerStorageValue(player, 18012) < 1 then
				local temptwo = getPlayerVocation(player)
				if temptwo == 9 then
					doPlayerSetVocation(player, 5)
				elseif temptwo == 10 then
					doPlayerSetVocation(player, 6)
				elseif temptwo == 11 then
					doPlayerSetVocation(player, 7)
				elseif temptwo == 12 then
					doPlayerSetVocation(player, 8)
				end
			else
				return false
			end
		end
	end
	return true
end
ringCheck:interval(250)
ringCheck:register()
