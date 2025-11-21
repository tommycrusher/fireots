			miningAndHerbalism = {
				[2740] = {tool = 2550, loot = {{2801, 4}}},
				[2767] = {tool = 2550, loot = {{2804, 4}, {2803, 7}, {2799, 4}}},
				[2771] = {tool = 2550, loot = {{2801, 4}, {2802, 4}, {2804, 5}}},
				[2741] = {tool = 2550, loot = {{2800, 6}, {2802, 4}, {2803, 5}}},
				[2768] = {tool = 2550, loot = {{2801, 7}, {2803, 5}, {2799, 4}}},
				[2743] = {tool = 2550, loot = {{2798, 4}, {2804, 5}, {2799, 4}}},
				[2769] = {tool = 2550, loot = {{2805, 4}, {2802, 5}, {2804, 3}}},
				[2783] = {tool = 2550, loot = {{2801, 6}, {2800, 7}, {2803, 6}}},
				[4179] = {tool = 2566, loot = {{2794, 2}}},
				[4180] = {tool = 2566, loot = {{2792, 3}}},
				[4181] = {tool = 2566, loot = {{2794, 4}}},
				[4178] = {tool = 2566, loot = {{2792, 5}}},
				[4171] = {tool = 2566, loot = {{2787, 5}}},
				[4170] = {tool = 2566, loot = {{2791, 5}, {2789, 4}}},
				[4179] = {tool = 2566, loot = {{2789, 6}, {2791, 7}}},
				[4177] = {tool = 2566, loot = {{2793, 5}, {2787, 7}}},
				[4167] = {tool = 2550, loot = {{2791, 3}}},
				[4168] = {tool = 2550, loot = {{2790, 4}}},
				[4169] = {tool = 2550, loot = {{2791, 5}}},
				[4174] = {tool = 2550, loot = {{2790, 5}, {2795, 5}}},
				[4175] = {tool = 2550, loot = {{2791, 4}, {2796, 6}}},
				[4172] = {tool = 2550, loot = {{2791, 5}, {2796, 6}, {2792, 4}}},
				[4173] = {tool = 2550, loot = {{2795, 5}, {2787, 7}, {2793, 7}}},
				[3607] = {tool = 2422, loot = {{2150, 2}}},
				[3608] = {tool = 2422, loot = {{2149, 2}}},
				[3609] = {tool = 2422, loot = {{2150, 2}}},
				[3615] = {tool = 2422, loot = {{2147, 2}}},
				[3616] = {tool = 2422, loot = {{2149, 2}}},
				[1357] = {tool = 2422, loot = {{2146, 2}}},
				[1356] = {tool = 2422, loot = {{9970, 2}}},
				[1285] = {tool = 2422, loot = {{2149, 2}}},
				[5868] = {tool = 2553, loot = {{2149, 2}, {2146, 2}, {9970, 2}}},
				[5867] = {tool = 2553, loot = {{5889, 1}, {2146, 2}, {9970, 2}}},
				[5866] = {tool = 2553, loot = {{5892, 1}, {2149, 2}, {2147, 2}, {9970, 2}}},
				[5753] = {tool = 2553, loot = {{5888, 1}, {2150, 2}, {2146,2 }, {9970, 2}, {2156, 1}}},
				[5751] = {tool = 2553, loot = {{5887, 1}, {2149, 2}, {2147, 2}, {9970, 2}, {2158, 1}}}
			}
			professionsConfig = {
				storages = {
					blacksmithing = 30000,
					alchemy = 30001,
					inscription = 30006,
					tailoring = 30002,
					leatherworking = 30003,
					engeneering = 30004
				},
				tools = {
					blacksmithing = {2557, 2553, 1961},
					alchemy = {2565, 2566, 2568, 1966},
					inscription = {2366, 2571, 2566, 1962},
					tailoring = {2366},
					leatherworking = {5908, 2566},
					engeneering = {2556, 2557, 2558, 2553}
				},		
				maxSkill = 210,
				professionStorage = 30005
			}
			books = {
				[1961] = {"blacksmithing", blacksmithingRecipes, (professionsConfig.storages).blacksmithing},
				[1981] = {"alchemy", alchemyRecipes, (professionsConfig.storages).alchemy},
				[1977] = {"inscription", inscriptionRecipes, (professionsConfig.storages).inscription},
				[2217] = {"tailoring", tailoringRecipes, (professionsConfig.storages).tailoring},
				[1978] = {"leatherworking", leatherworkingRecipes, (professionsConfig.storages).leatherworking},
				[2325] = {"engeneering", engeneeringRecipes, (professionsConfig.storages).engeneering}
			}

			function doPlayerAddOwnSkill(cid, skill, craftValue)
				local skill = skill == "blacksmithing" and (professionsConfig.storages).blacksmithing or skill == "alchemy" and (professionsConfig.storages).alchemy or skill == "inscription" and (professionsConfig.storages).inscription or skill == "tailoring" and (professionsConfig.storages).tailoring or skill == "leatherworking" and (professionsConfig.storages).leatherworking or skill == "engeneering" and (professionsConfig.storages).engeneering
				local skillValue = math.max(0, getPlayerStorageValue(cid, skill))
				if(skillValue >= professionsConfig.maxSkill) then
					return true
				end
				if (craftValue + 10 > skillValue) then
					return setPlayerStorageValue(cid, skill, skillValue + 1)
				elseif (craftValue + 30 > skillValue) then
					return math.random(1, 4) == 1 and (setPlayerStorageValue(cid, skill, skillValue + 1))	
				else
					return math.random(1, 15) == 1 and (setPlayerStorageValue(cid, skill, skillValue + 1))
				end
			end
