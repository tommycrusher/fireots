local ringDeath = CreatureEvent("RingDeath")
function ringDeath.onPrepareDeath(cid, lastHitKiller, mostDamageKiller)
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
        return true
end 
ringDeath:register()
