-- config stones
			stonesConfig = {
				stones = {
					['Wind Stone'] = {
						experience = 25000000,
						rewardID = {2346, 8306, 6512, 9941, 7720}, -- reward id which player can win "points, pure energy, crystal of focus, santa doll, build plans" (reward is random)
						resp = true,  -- czy ma go tworzyc automatycznie (globaleventem nizej)
						storage = 20001,
						secondStorage = 20002,
						appearEffect = CONST_ME_INSECTS
					},
					['Fire Stone'] = {
						experience = 25000000,
						rewardID = {2346, 8306, 6512, 9941, 7720}, -- reward id which player can win "points, pure energy, crystal of focus, santa doll, build plans"(reward is random)
						resp = true,  -- czy ma go tworzyc automatycznie (globaleventem nizej)
						storage = 20003,
						secondStorage = 20004,
						appearEffect = CONST_ME_FIREAREA
					},
					['Icy Stone'] = {
						experience = 25000000,
						rewardID = {2346, 8306, 6512, 9941, 7720}, -- reward id which player can win "points, pure energy, crystal of focus, santa doll, build plans"(reward is random)
						resp = true,  -- czy ma go tworzyc automatycznie (globaleventem nizej)
						storage = 20005,
						secondStorage = 20006,
						appearEffect = CONST_ME_ICETORNADO
					},
					['Earth Stone'] = {
						experience = 25000000,
						rewardID = {2346, 8306, 6512, 9941, 7720}, -- reward id which player can win "points, pure energy, crystal of focus, santa doll, build plans"(reward is random)
						resp = true,  -- czy ma go tworzyc automatycznie (globaleventem nizej)
						storage = 20007,
						secondStorage = 20008,
						appearEffect = CONST_ME_GROUNDSHAKER
					},
					['Metin of Darkness'] = {
						experience = 45000000,
						rewardID = {2346, 8306, 9941, 7720, 7958, 9932, 7450, 2508, 2352, 7416, 8858, 2538, 2437}, -- reward id which player can win "points, pure energy, santa doll, build plans, jester staff, firewalker boots, hammer of prophecy, mystical armor, crystal arrow, edge bloody, elemental bow, "(reward is random)
						resp = false,  -- czy ma go tworzyc automatycznie (globaleventem nizej)
						storage = 20009,
						secondStorage = 20010,
						appearEffect = CONST_ME_GROUNDSHAKER
					}
				},
			
				positions = {
				{x=974, y=1082, z=7},
				{x=1032, y=1054, z=7},
				{x=1089, y=1068, z=7},
				{x=1054, y=1112, z=7},
				{x=1084, y=971, z=7}
				},

			stones_days = {
					['Monday'] = {'10:59:20'},
					['Monday'] = {'14:59:20'},
					['Monday'] = {'17:59:20'},
					['Monday'] = {'19:59:20'},
					['Tuesday'] = {'10:59:20'},
					['Tuesday'] = {'14:59:20'},
					['Tuesday'] = {'17:59:20'},
					['Tuesday'] = {'19:59:20'},
					['Wednesday'] = {'10:59:20'},
					['Wednesday'] = {'14:59:20'},
					['Wednesday'] = {'17:59:20'},
					['Wednesday'] = {'21:22:20'},
					['Thursday'] = {'10:59:20'}, 
					['Thursday'] = {'14:59:20'},
					['Thursday'] = {'17:59:20'},
					['Thursday'] = {'19:59:20'},
					['Friday'] = {'10:59:20'},
					['Friday'] = {'14:59:20'},
					['Friday'] = {'17:59:20'},
					['Friday'] = {'19:59:20'},
					['Sunday'] = {'10:59:20'},
					['Sunday'] = {'14:59:20'},
					['Sunday'] = {'17:59:20'},
					['Sunday'] = {'19:59:20'},
					['Saturday'] = {'10:59:20'},
					['Saturday'] = {'14:59:20'},
					['Saturday'] = {'17:59:20'},
					['Saturday'] = {'19:59:20'}
			},

				maxTopPlayers = 6,
				maxDistance = 6,
				maxStones = 2,
				storage = 20000,
				pos_od = {x=949,y=1068,z=7}, --lewy gorny rog
				pos_do = {x=1077,y=1126,z=7}, --prawy dolny rog
				time = 360, --pierwsze i kazde nastepne losowanie od momentu startu serwera, w minutach
				chance = 50 --szansa na wylosowanie kamulca
			},

			summons = {
				['Wind Stone'] = {
					{90, {'Behemoth', 'Behemoth', 'Behemoth', 'Behemoth', 'Ghastly Dragon', 'Behemoth', 'Behemoth', 'Undead Dragon', 'Undead Dragon'}},
					{70, {'Ghastly Dragon', 'Ghastly Dragon', 'Ghastly Dragon', 'Nosferatu', 'vile centurion', 'vile centurion'}},
					{50, {'hand of darkness', 'hand of darkness', 'hand of darkness', 'Ise', 'Ghastly Dragon', 'Ghastly Dragon', 'Undead Dragon', 'Undead Dragon'}},
					{40, {'Ghazbaran', 'Ghazbaran', 'Eye of Terror', 'hand of darkness', 'hand of darkness', 'hand of darkness', 'hand of darkness'}},
					{20, {'apocalypse', 'apocalypse', 'hand of darkness', 'hand of darkness', 'vile centurion', 'vile centurion', 'Undead Dragon'}},
					{5, {'apocalypse', 'Ghazbaran', 'Eye of Terror', 'Nosferatu', 'hand of darkness', 'hand of darkness', 'vile centurion'}},
					{0, {}},
				},
				['Fire Stone'] = {
					{90, {'dragon lord', 'dragon lord', 'dragon lord', 'dragon lord', 'demon', 'demon', 'diabolic imp', 'diabolic imp'}},
					{70, {'dragon lord', 'dragon lord', 'demon', 'demon', 'demon', 'diabolic imp', 'diabolic imp', 'diabolic imp', 'diabolic imp'}},
					{50, {'demon', 'demon', 'orshabaal', 'demon', 'diabolic imp', 'diabolic imp', 'diabolic imp', 'diabolic imp'}},
					{40, {'Phyrus the ancient', 'Phyrus the ancient', 'Phyrus the ancient', 'Phyrus the ancient', 'hellfire fighter', 'hellfire fighter'}},
					{20, {'orshabaal', 'orshabaal', 'hellfire fighter', 'hellfire fighter', 'Phyrus the ancient', 'Phyrus the ancient', 'diabolic imp', 'diabolic imp'}},
					{5, {'infernatill', 'infernatill', 'diabolic imp', 'diabolic imp', 'demon', 'demon', 'demon', 'diabolic imp', 'diabolic imp'}},
					{0, {}},
				},
				['Icy Stone'] = {
					{90, {'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon'}},
					{70, {'frost dragon', 'yeti', 'frost dragon', 'yeti', 'frost dragon', 'yeti'}},
					{50, {'azerus', 'azerus'}},
					{30, {'azerus', 'azerus'}},
					{10, {'azerus', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti'}},
					{6, {'azerus', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti'}},
					{5, {'azerus', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'azerus'}},
					{0, {}},
				},
				['Earth Stone'] = {
					{90, {'hydra', 'hydra', 'hydra', 'bog raider', 'bog raider', 'bog raider', 'bog raider', 'bog raider', 'Plaguesmith', 'Plaguesmith', 'Plaguesmith'}},
					{70, {'defiler', 'hellhound', 'defiler', 'defiler', 'hellhound', 'medusa', 'medusa', 'medusa', 'medusa', 'Plaguesmith', 'Plaguesmith'}},
					{50, {'azerus', 'hellhound', 'hellhound', 'hellhound', 'defiler', 'Plaguesmith', 'Plaguesmith', 'Plaguesmith', 'Phantasm', 'Phantasm'}},
					{40, {'azerus', 'Massacre', 'Massacre', 'Massacre'}},
					{20, {'juggernaut', 'juggernaut', 'juggernaut', 'defiler', 'defiler', 'hellhound', 'azerus', 'azerus'}},
					{5, {'azerus', 'azerus', 'juggernaut', 'juggernaut', 'hellhound', 'hellhound', 'hellhound', 'hellhound', 'juggernaut', 'Plaguesmith', 'Plaguesmith', 'Plaguesmith', 'Phantasm', 'Phantasm'}},
					{0, {}},
				},
				['Metin of Darkness'] = {
					{98, {'rook spawn', 'rook spawn', 'rook spawn'}},
					{95, {'hydra', 'hydra', 'hydra', 'bog raider', 'bog raider', 'bog raider', 'bog raider', 'bog raider', 'Plaguesmith', 'Plaguesmith', 'Plaguesmith'}},
					{93, {'Behemoth', 'Behemoth', 'Behemoth', 'Behemoth', 'Ghastly Dragon', 'Behemoth', 'Behemoth', 'Undead Dragon', 'Undead Dragon'}},
					{91, {'dragon lord', 'dragon lord', 'dragon lord', 'dragon lord', 'demon', 'demon', 'diabolic imp', 'diabolic imp'}},
					{89, {'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon', 'frost dragon'}},
					{75, {'defiler', 'hellhound', 'defiler', 'defiler', 'hellhound', 'medusa', 'medusa', 'medusa', 'medusa', 'Plaguesmith', 'Plaguesmith'}},
					{73, {'Ghastly Dragon', 'Ghastly Dragon', 'Ghastly Dragon', 'Nosferatu', 'vile centurion', 'vile centurion'}},
					{71, {'dragon lord', 'dragon lord', 'demon', 'demon', 'demon', 'diabolic imp', 'diabolic imp', 'diabolic imp', 'diabolic imp'}},
					{69, {'frost dragon', 'yeti', 'frost dragon', 'yeti', 'frost dragon', 'yeti'}},
					{61, {'rook spawn', 'rook spawn','rook spawn', 'rook spawn', 'rook spawn'}},
					{55, {'azerus', 'hellhound', 'hellhound', 'hellhound', 'defiler', 'Plaguesmith', 'Plaguesmith', 'Plaguesmith', 'Phantasm', 'Phantasm'}},
					{53, {'hand of darkness', 'hand of darkness', 'hand of darkness', 'Ise', 'Ghastly Dragon', 'Ghastly Dragon', 'Undead Dragon', 'Undead Dragon'}},
					{51, {'demon', 'demon', 'orshabaal', 'demon', 'diabolic imp', 'diabolic imp', 'diabolic imp', 'diabolic imp'}},
					{49, {'azerus', 'azerus'}},
					{45, {'azerus', 'Massacre', 'Massacre', 'Massacre'}},
					{43, {'Ghazbaran', 'Ghazbaran', 'Eye of Terror', 'hand of darkness', 'hand of darkness', 'hand of darkness', 'hand of darkness'}},
					{41, {'Phyrus the ancient', 'Phyrus the ancient', 'Phyrus the ancient', 'Phyrus the ancient', 'hellfire fighter', 'hellfire fighter'}},
					{39, {'azerus', 'azerus'}},
					{31, {'rook spawn', 'rook spawn','rook spawn', 'rook spawn', 'rook spawn'}},
					{25, {'juggernaut', 'juggernaut', 'juggernaut', 'defiler', 'defiler', 'hellhound', 'azerus', 'azerus'}},
					{23, {'apocalypse', 'apocalypse', 'hand of darkness', 'hand of darkness', 'vile centurion', 'vile centurion', 'Undead Dragon'}},
					{21, {'orshabaal', 'orshabaal', 'hellfire fighter', 'hellfire fighter', 'Phyrus the ancient', 'Phyrus the ancient', 'diabolic imp', 'diabolic imp'}},
					{19, {'azerus', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti'}},
					{14, {'rook spawn', 'rook spawn','rook spawn', 'rook spawn', 'rook spawn'}},
					{10, {'azerus', 'azerus', 'juggernaut', 'juggernaut', 'hellhound', 'hellhound', 'hellhound', 'hellhound', 'juggernaut', 'Plaguesmith', 'Plaguesmith', 'Plaguesmith', 'Phantasm', 'Phantasm'}},
					{8, {'apocalypse', 'Ghazbaran', 'Eye of Terror', 'Nosferatu', 'hand of darkness', 'hand of darkness', 'vile centurion'}},
					{6, {'infernatill', 'infernatill', 'diabolic imp', 'diabolic imp', 'demon', 'demon', 'demon', 'diabolic imp', 'diabolic imp'}},
					{4, {'azerus', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'yeti', 'azerus'}},
					{2, {'Fire Stone', 'Wind Stone', 'Earth Stone', 'Icy Stone'}},
					{0, {}},
				}
			},
			
			u = 0
--end config
-- function stones
		function isWalkable(pos, creature, proj, pz)
			if getTileThingByPos({x=pos.x,y=pos.y,z=pos.z,stackpos=0}).itemid == 0 then return false end
			if getTopCreature(pos).uid > 0 and creature then return false end
			if getTileInfo(pos).protection and pz then return false, true end
			local n = not proj and 3 or 2
			for i = 0, 255 do
				pos.stackpos = i
				local tile = getTileThingByPos(pos)
				if tile.itemid ~= 0 and not isCreature(tile.uid) then
					if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
						return false
					end
				end
			end
			return true
		end	

		function checkPositions(fromPos, toPos)
			local pos = {x=math.random(fromPos.x,toPos.x), y=math.random(fromPos.y,toPos.y), z=math.random(fromPos.z,toPos.z)}
			if isWalkable(pos, true, true, true) then
				return pos
			end
			return checkPositions(fromPos, toPos)
		end

		function setStone(stonesConfig, metin_stones)
			local area = {
				{1, 1, 1},
				{1, 1, 1},
				{1, 1, 1},
			}
			local pos = checkPositions(stonesConfig.pos_od, stonesConfig.pos_do)
			if pos and math.random(100) <= stonesConfig.chance then
				local stones = {}
				for k, _ in pairs(stonesConfig.stones) do
					table.insert(stones, k)
				end
				local stone = stones[math.random(#stones)]
				local mon = doCreateMonster(stone, pos, false, flase)
				doSendMagicEffectInArea(getThingPos(mon), stonesConfig.stones[stone].appearEffect, area)
				doBroadcastMessage(stone..' have been spawn. Find and defeat it.', MESSAGE_STATUS_WARNING)
				doCreatureSetStorage(mon, stonesConfig.stones[getCreatureName(mon)].secondStorage, 1)
				doSetStorage(stonesConfig.stones[getCreatureName(mon)].storage, 1)
				doSetStorage(stonesConfig.storage, getStorage(stonesConfig.storage) + 1)
			end
			return addEvent(setStone, stonesConfig.time * 60 * 1000, stonesConfig, metin_stones)
		end	
		
			function getSummonsToSummon(pctHealth, x, storage, cid)
				local summon = {}

				for i = 2, #x do
					if pctHealth >= x[i][1] and pctHealth < x[i - 1][1] then
						if getCreatureStorage(cid, storage) ~= i - 1 then
							local l, v = i - 1, 0
							for j = getCreatureStorage(cid, storage), l do
								for _, name in pairs(x[j][2]) do
									table.insert(summon, name)
								end
								v = v + 1
							end
							doCreatureSetStorage(cid, storage, getCreatureStorage(cid, storage) + v)
							return summon
						else
							for _, name in pairs(x[i - 1][2]) do
								table.insert(summon, name)
							end
							doCreatureSetStorage(cid, storage, getCreatureStorage(cid, storage) + 1)
							return summon
						end
					end
				end
				return summon
			end

			function doSendMagicEffectInArea(pos, effect, area) -- Function by mock
				local centro = {}
				centro.y = math.floor(#area / 2) + 1
				for y = 1, #area do
					for x = 1, #area[y] do
						if area[y][x] > 0 then
							centro.x = math.floor(#area[y] / 2) + 1
							doSendMagicEffect({x=pos.x+x-centro.x, y=pos.y+y-centro.y, z=pos.z}, (effect or 0))
						end
					end
				end
				return true
			end
			
			function addDamageToArea(pos, area) -- Function by mock
				local centro = {}
				centro.y = math.floor(#area / 2) + 1
				for y = 1, #area do
					for x = 1, #area[y] do
						if area[y][x] > 0 then
							centro.x = math.floor(#area[y] / 2) + 1
							local t = getThingfromPos({x=pos.x+x-centro.x, y=pos.y+y-centro.y, z=pos.z, stackpos=253}).uid
							if isPlayer(t) then
								doCreatureAddHealth(t, - (getCreatureMaxHealth(t) * 1 / 100))
								doCreatureAddMana(t, - (getCreatureMaxMana(t) * 1 / 100))
							end
							doSendMagicEffect({x=pos.x+x-centro.x, y=pos.y+y-centro.y, z=pos.z}, 34)
						end
					end
				end
				return true
			end			
			
			function doCleanArea(pos, area) -- Function by mock
				local centro = {}
				centro.y = math.floor(#area / 2) + 1
				for y = 1, #area do
					for x = 1, #area[y] do
						if area[y][x] > 0 then
							centro.x = math.floor(#area[y] / 2) + 1	
							local i = getTileItemByType({x=pos.x+x-centro.x, y=pos.y+y-centro.y, z=pos.z}, ITEM_TYPE_MAGICFIELD)
							if i.uid > 0 then
								doRemoveItem(i.uid)
							end
						end
					end
				end
				return true
			end
--end functions
	local summonStones = GlobalEvent("SummonStones")
			function summonStones.onThink(interval)

			local days = {
					['Tuesday'] = {'17:59:20'}, 
					['Thursday'] = {'17:59:20'}, 
					['Friday'] = {'17:59:20'}, 
					['Sunday'] = {'17:59:20'},
				}
			local area = {
				{1, 1, 1},
				{1, 1, 1},
				{1, 1, 1},
			}
			local daysOpen = {}			
			for k, v in ipairs(days) do
				table.insert(daysOpen, k)
			end
				--if isInArray(daysOpen, os.date('%A')) then
					--if isInArray(configZombieEvent.days[os.date('%A')], os.date('%X', os.time())) then

				local names, stonesSum = {}, {}
				
				for k, v in ipairs(stonesConfig.stones) do
					if getStorage(v.storage) <= 0 then
						if v.resp == true then
							table.insert(names, k)
						end
					end
				end
				
				if #names == 0 then
					return false
				end
				
				local pos, name = positions[math.random(#positions)], names[math.random(#names)]
				
				if getStorage(stonesConfig.storage) < 0 then
					doSetStorage(stonesConfig.storage, 0)
				end
				
				if getStorage(stonesConfig.storage) + 1 > stonesConfig.maxStones then
					for o, p in pairs(stonesConfig.stones) do
						if getStorage(p.storage) == 1 then
							table.insert(stonesSum, o)
						end
					end
					
					if #stonesSum == 0 then
						if u ~= 1 then
							doSetStorage(stonesConfig.storage, 0)
							u = 1
						end
					else					
						local rand = math.random(#stonesSum)
						local mon = getCreatureByName(stonesSum[rand])
						if isCreature(mon) then
							doSendMagicEffect(getThingPos(mon), 10)
							doSetStorage(stonesConfig.stones[stonesSum[rand]].storage, 0)
							doSetStorage(stonesConfig.stones[stonesSum[rand]].secondStorage, 1)
							doSetStorage(stonesConfig.storage, getStorage(stonesConfig.storage) - 1)

							doRemoveCreature(mon)
							table.remove(stonesSum, rand)
						end
					end
				end

				local monsters = doCreateMonster(name, pos, true, true)
				if type(monsters) == "number" then
					doSendMagicEffectInArea(getThingPos(monsters), stonesConfig.stones[name].appearEffect, area)

					doBroadcastMessage(name..' have been spawn. Find and defeat it.', MESSAGE_STATUS_WARNING)
					doCreatureSetStorage(monsters, stonesConfig.stones[name].secondStorage, 1)

					doSetStorage(stonesConfig.stones[name].storage, 1)
					doSetStorage(stonesConfig.storage, getStorage(stonesConfig.storage) + 1)
				end
					--end
				--end
				return true
			end
	--summonStones:register()
	--summonStones:interval(8154321)

	local statStones = CreatureEvent("StatStones")
			function statStones.onStatsChange(cid, attacker, type, combat, value)
				local stor = 546849
				if #getCreatureSummons(cid) > 0 and value > 0 and type == 1 then
					if isPlayer(attacker) then
						if exhaustion.check(attacker, stor) ~= true then
							doPlayerSendTextMessage(attacker, MESSAGE_STATUS_CONSOLE_BLUE, 'You have to kill stone\'s summons until you will be able to kill it.')
							exhaustion.set(attacker, stor, 5)
						end
					end
					return false
				end				
				return true
			end
	--statStones:register()

	local eventStones = CreatureEvent("EventStones")
			local area = {
				{1, 0, 0, 1, 0, 0, 1},
				{0, 0, 1, 1, 1, 0, 0},
				{0, 1, 1, 1, 1, 1, 0},
				{1, 1, 1, 1, 1, 1, 1},
				{0, 1, 1, 1, 1, 1, 0},
				{0, 0, 1, 1, 1, 0, 0},
				{1, 0, 0, 1, 0, 0, 1},
			}
			
			local cleanArea = {
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
				{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			}

			function eventStones.onThink(cid, interval)
				local xTable, pct = summons[getCreatureName(cid)], getCreatureHealth(cid) / getCreatureMaxHealth(cid) * 100

				if not xTable then
					return false
				end
				
				if getCreatureStorage(cid, stonesConfig.stones[getCreatureName(cid)].secondStorage) <= 0 then
					doCreatureSetStorage(cid, stonesConfig.stones[getCreatureName(cid)].secondStorage, 1)
				end

				table.sort(xTable, function(a, b) return a[1] > b[1] end)

				local summonsToSumm = getSummonsToSummon(pct, xTable, stonesConfig.stones[getCreatureName(cid)].secondStorage, cid)

				if #summonsToSumm ~= 0 then
					doCleanArea(getThingPos(cid), cleanArea)
					addDamageToArea(getThingPos(cid), area)
					
					local number, k = #getCreatureSummons(cid), 0
					for _, mName in pairs(summonsToSumm) do
						doSummonMonster(cid, mName)
					end
					
					for _, j in ipairs(getCreatureSummons(cid)) do
						k = k + 1
						if number <= k then
							doSendMagicEffect(getThingPos(j), 34)
						end
					end
					
					doCreatureSay(cid, 'I will be alive until my soldiers won\'t be killed!', TALKTYPE_MONSTER_YELL)
				end

				for _, y in ipairs(getCreatureSummons(cid)) do
					if isCreature(y) then
						if getDistanceBetween(getThingPos(cid), getThingPos(y)) > stonesConfig.maxDistance then
							doTeleportThing(y, getThingPos(cid))
						end
					end
				end
				return true
			end
	--eventStones:register()

	local deathStones = CreatureEvent("DeathStones")
			function deathStones.onDeath(cid, corpse, deathList)
				doCreatureSay(cid, 'I WILL BACK THERE!', TALKTYPE_MONSTER)
				local i, v = 1, stonesConfig.stones[getCreatureName(cid)]
				
				doCreatureSetStorage(cid, v.secondStorage, 1)
				doSetStorage(v.storage, -1)
				doSetStorage(stonesConfig.storage, getStorage(stonesConfig.storage) - 1)

				for _, pid in ipairs(deathList) do
					if isPlayer(pid) then
						local item = math.random(#v.rewardID)
						doPlayerAddExperience(pid, v.experience)
						doPlayerAddItem(pid, v.rewardID[item], 1)
						doPlayerSendTextMessage(pid, MESSAGE_EVENT_ADVANCE, 'Congratulation!\nYou defeat the ' .. getCreatureName(cid) .. '. Your reward is ' .. getItemNameById(v.rewardID[item]) .. '.')
						--doSendAnimatedText(getThingPos(pid), v.experience, COLOR_WHITE)
						
						i = i + 1

						if i == stonesConfig.maxTopPlayers then
							break
						end
					end
				end
				return true
			end
	deathStones:register()

	local startStones = GlobalEvent("EventStones")
			function startStones.onStartup()				
				for k, v in pairs(stonesConfig.stones) do
					doSetStorage(v.storage, -1)
				end

				doSetStorage(stonesConfig.storage, 0)

				return true
			end
	startStones:register()

	local talkStones = TalkAction("/stones")
			function talkStones.onSay(cid, words, param)
				if not player:getGroup():getAccess() then --or player:getAccountType() < ACCOUNT_TYPE_GOD 
					return true
				end
				if getStorage(stonesConfig.storage) > 0 then
					return doPlayerSendCancel(cid, 'Stone Event is already running.')
				end
				setStone(stonesConfig, stonesConfig.stones)
				doSetStorage(stonesConfig.storage, 0)
				return true
			end
	--talkStones:register()
