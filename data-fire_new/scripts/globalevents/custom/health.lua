local health = GlobalEvent("Health")
function health.onThink(interval)
local pos =
{
	{{x = 99, y = 2045, z = 7}, {x = 99, y = 2045, z = 7, stackpos = 253}},
	{{x = 99, y = 2044, z = 7}, {x = 99, y = 2044, z = 7, stackpos = 253}},
	{{x = 100, y = 2044, z = 7}, {x = 100, y = 2044, z = 7, stackpos = 253}},
	{{x = 101, y = 2044, z = 7}, {x = 101, y = 2044, z = 7, stackpos = 253}},
	{{x = 101, y = 2045, z = 7}, {x = 101, y = 2045, z = 7, stackpos = 253}},
	{{x = 101, y = 2046, z = 7}, {x = 101, y = 2046, z = 7, stackpos = 253}},
	{{x = 100, y = 2046, z = 7}, {x = 100, y = 2046, z = 7, stackpos = 253}},
	{{x = 99, y = 2046, z = 7}, {x = 99, y = 2046, z = 7, stackpos = 253}},
	{{x = 100, y = 2045, z = 7}, {x = 100, y = 2045, z = 7, stackpos = 253}},
}
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

function onGetFormulaValues(cid, level, maglevel)
	min = (level * 2 + maglevel * 4) * 2.08
	max = (level * 2 + maglevel * 4) * 2.7
	if min < 250 then
		min = 250
	end
	return min, max
end
--health:interval(3000)
--health:register()
