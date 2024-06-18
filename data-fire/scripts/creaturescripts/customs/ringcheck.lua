local ringCheck = CreatureEvent("RingCheck")

function ringCheck.onThink(cid, interval)
	if isPlayer(cid) and getPlayerStorageValue(cid, 50781) < 1 then
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
	else
		return true
	end
end

--ringCheck:interval(1000)
ringCheck:register()
