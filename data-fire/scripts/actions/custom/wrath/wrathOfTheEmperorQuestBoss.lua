local boss = {
	[3193] = "Fury Of The Emperor",
	[3194] = "Wrath Of The Emperor",
	[3195] = "Scorn Of The Emperor",
	[3196] = "Spite Of The Emperor",
}
local woeQB = Action()
function woeQB.onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 12318 and boss[itemEx.uid] and itemEx.itemid == 12383) then
		doTransformItem(itemEx.uid, 11753)
		doSummonCreature(boss[itemEx.uid], {x = toPosition.x + 4, y = toPosition.y, z = toPosition.z})
		setGlobalStorageValue(itemEx.uid - 4, 1)
	elseif(item.itemid == 12318 and itemEx.itemid == 12317) then
		if(toPosition.x > 33034 and toPosition.x < 33071 and
			toPosition.y > 31079 and toPosition.y < 31102) then
			if(getPlayerStorageValue(cid, 1090) == 1) then
				setPlayerStorageValue(cid, 1090, 2)
				doCreatureSay(cid, "The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_ORANGE_1)
			end	
		elseif(toPosition.x > 33080 and toPosition.x < 33111 and
			toPosition.y > 31079 and toPosition.y < 31100) then
			if(getPlayerStorageValue(cid, 1090) == 2) then
				setPlayerStorageValue(cid, 1090, 3)
				doCreatureSay(cid, "The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_ORANGE_1)
			end	
		elseif(toPosition.x > 33078 and toPosition.x < 33112 and
			toPosition.y > 31106 and toPosition.y < 31127) then
			if(getPlayerStorageValue(cid, 1090) == 3) then
				setPlayerStorageValue(cid, 1090, 4)
				doCreatureSay(cid, "The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_ORANGE_1)
			end	
		elseif(toPosition.x > 33035 and toPosition.x < 33069 and
			toPosition.y > 31107 and toPosition.y < 31127) then
			if(getPlayerStorageValue(cid, 1090) == 4) then
				setPlayerStorageValue(cid, 1090, 5)
				doCreatureSay(cid, "The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_ORANGE_1)
				doTeleportThing(cid, {x = 33072, y = 31151, z = 15})
				doSendMagicEffect({x = 33072, y = 31151, z = 15}, CONST_ME_TELEPORT)
			end	
		end
	elseif(item.itemid == 12318 and itemEx.itemid == 12385) then
		if(getPlayerStorageValue(cid, 1060) == 33) then
			doCreatureSay(cid, "NOOOoooooooo...!", TALKTYPE_ORANGE_1, false, cid, toPosition)
			doCreatureSay(cid, "This should have dealt the deathblow to the snake things' ambitions.", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 1060, 34)
		end
	end
	return true
end
woeQB:id(12318)
woeQB:register()
