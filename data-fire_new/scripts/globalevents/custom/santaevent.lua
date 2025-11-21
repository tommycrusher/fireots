local config = {	
	fromPosition = {x = 1027, y = 1003, z = 7}, -- top left cornor of the playground (random items drop)
    toPosition = {x = 1031, y = 1007, z = 7}, -- bottom right cornor of the playground (random items drop)
 
	minPlayers = 1, -- min players to start event
	npcName = "Santa Claus",
	prize = {2148,2152,2687,6501,6574,6569,2688,6506,6507,6508,6509,6510,6511} -- rewards
}
 
function onThink(interval, lastExecution, thinkInterval)
	local players = {}
	for x = (config.fromPosition).x, (config.toPosition).x do
		for y = (config.fromPosition).y, (config.toPosition).y do
			for z = (config.fromPosition).z, (config.toPosition).z do
				if(isPlayer(getTopCreature({x = x, y = y, z = z}).uid)) then
					table.insert(players, getTopCreature({x = x, y = y, z = z}).uid)
				end
			end
		end
	end
 
	if(table.maxn(players) >= config.minPlayers) then
		local function senelis()
		pos = {x = math.random(config.fromPosition.x, config.toPosition.x), y = math.random(config.fromPosition.y, config.toPosition.y), z = math.random(config.fromPosition.z, config.toPosition.z)}
		local randomChanceItem = math.random(1, #config.prize)		
		doCreateItem(config.prize[randomChanceItem], 1, pos)
		doSendMagicEffect(pos, 55)
		end
		addEvent(doCreatureSay, 1000, getCreatureByName(config.npcName), "Ho ho ho, Merry Christmas Jigen folks!", TALKTYPE_ORANGE_1)
		addEvent(senelis, 2000)
		addEvent(senelis, 3000)
		addEvent(senelis, 4000)
		addEvent(senelis, 5000)
		addEvent(senelis, 6000)
		addEvent(doCreatureSay, 7000, getCreatureByName(config.npcName), "Ho ho ho, Merry Christmas Jigen folks!", TALKTYPE_ORANGE_1)
		end
	return true
end
