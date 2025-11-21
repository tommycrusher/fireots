local health1 = GlobalEvent("Health1")
local pos =
{
    {{x = 159, y = 53, z = 7},{x = 159, y = 53, z = 7, stackpos = 253}},
    {{x = 160, y = 53, z = 7},{x = 160, y = 53, z = 7, stackpos = 253}},
    {{x = 161, y = 53, z = 7},{x = 161, y = 53, z = 7, stackpos = 253}},
    {{x = 159, y = 54, z = 7},{x = 159, y = 54, z = 7, stackpos = 253}},
    {{x = 160, y = 54, z = 7},{x = 160, y = 54, z = 7, stackpos = 253}},
    {{x = 161, y = 54, z = 7},{x = 161, y = 54, z = 7, stackpos = 253}},
    {{x = 159, y = 55, z = 7},{x = 159, y = 55, z = 7, stackpos = 253}},
    {{x = 160, y = 55, z = 7},{x = 160, y = 55, z = 7, stackpos = 253}},
    {{x = 161, y = 55, z = 7},{x = 161, y = 55, z = 7, stackpos = 253}},
    }
function health1.onThink(interval)
	for _, positions in pairs(pos) do
		doSendMagicEffect(positions[1], 12)
		if getThingFromPos(positions[2]).itemid > 0 then
			for _, name in pairs(getOnlinePlayers()) do
				local player = getPlayerByName(name)
                    		doCreatureAddHealth(player, 750)
            		end
        	end
    	end
	return true
end
--health1:interval(3000)
--health1:register()
