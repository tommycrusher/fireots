local hallowedAxe = Action()
function hallowedAxe.onUse(cid, item, fromPosition, itemEx, toPosition)
treepos = {x=770, y=952, z=7, stackpos=1}
treepos2 = {x=766, y=952, z=7, stackpos=1} --- position of left arm
treepos3 = {x=768, y=950, z=7, stackpos=1} --- position of crow
treepos4 = {x=768, y=953, z=7, stackpos=1} --- position of mouth
monster1 = {x=771, y=955, z=7}
monster2 = {x=766, y=956, z=7}
monster3 = {x=763, y=952, z=7}
monster4 = {x=765, y=949, z=7}
tree = getThingfromPos(treepos).uid
tree2 = getThingfromPos(treepos2).uid
tree3 = getThingfromPos(treepos3).uid
tree4 = getThingfromPos(treepos4).uid
playerPos = getCreaturePosition(cid)
local randomizer = math.random(1,6)
queststatus = getPlayerStorageValue(cid,8181)
queststatus2 = getPlayerStorageValue(cid,8282)
queststatus3 = getPlayerStorageValue(cid,8383)
queststatus4 = getPlayerStorageValue(cid,8484)
Level = getPlayerLevel(cid)

	if itemEx.itemid == 2717 and itemEx.actionid == 7787 and Level >= 200 then
		doTeleportThing(cid, toPosition, TRUE)
		setPlayerStorageValue(cid,8181,1)
	else
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	if itemEx.itemid == 2717 and itemEx.actionid == 7788 then
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "A player is already doing this quest.")
	end
	if itemEx.itemid == 8289 and itemEx.actionid == 8181 and (randomizer == 1) and queststatus == 1 then
		doSummonCreature("Haunted Treeling", monster1)
		doSummonCreature("Vampire Bride", monster2)
		doSummonCreature("Hellspawn", monster3)
		doSummonCreature("Morgaroth", monster4)
	elseif itemEx.itemid == 8289 and itemEx.actionid == 8181 and (randomizer == 2) and queststatus == 1 then
		doSummonCreature("Vampire Bride", monster1)
		doSummonCreature("Vampire Bride", monster2)
		doSummonCreature("Nightstalker", monster3)
		doSummonCreature("Betrayed Wraith", monster4)
	elseif itemEx.itemid == 8289 and itemEx.actionid == 8181 and (randomizer == 3) and queststatus == 1 then
		doSummonCreature("Infernalist", monster1)
		setPlayerStorageValue(cid,8181,-1)
		setPlayerStorageValue(cid,8282,1)
	elseif itemEx.itemid == 8289 and itemEx.actionid == 8181 and (randomizer >= 4) and queststatus == 1 then
		doSendMagicEffect(playerPos, 45)
		doCreatureAddHealth(cid, -300)
		doSendAnimatedText(playerPos, '300', TEXTCOLOR_LIGHTGREEN)
		end
	if itemEx.itemid == 8289 and itemEx.actionid == 8181 and queststatus == -1 then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	if itemEx.itemid == 8288 and itemEx.actionid == 8282 and (randomizer == 1) and queststatus2 == 1 then
		doSummonCreature("Hellhound", monster1)
		doSummonCreature("Nightmare Scion", monster2)
		doSummonCreature("Wyrm", monster3)
		doSummonCreature("Juggernaut", monster4)
	elseif itemEx.itemid == 8288 and itemEx.actionid == 8282 and (randomizer == 2) and queststatus2 == 1 then
		doSummonCreature("Earth Overlord", monster1)
		doSummonCreature("Jagged Earth Elemental", monster2)
		doSummonCreature("Jagged Earth Elemental", monster3)
		doSummonCreature("Ron the Ripper", monster4)
	elseif itemEx.itemid == 8288 and itemEx.actionid == 8282 and (randomizer == 3) and queststatus2 == 1 then
		doSummonCreature("Ron the Ripper", monster1)
		doSummonCreature("Ron the Ripper", monster2)
		doSummonCreature("Nightmare Scion", monster3)
		doSummonCreature("Hellspawn", monster4)
		setPlayerStorageValue(cid,8282,-1)
		setPlayerStorageValue(cid,8383,1)
	elseif itemEx.itemid == 8288 and itemEx.actionid == 8282 and (randomizer >= 4) and queststatus2 == 1 then
		doSendMagicEffect(playerPos, 45)
		doCreatureAddHealth(cid, -300)
		doSendAnimatedText(playerPos, '300', TEXTCOLOR_LIGHTGREEN)
		end
	if itemEx.itemid == 8288 and itemEx.actionid == 8282 and queststatus2 == -1 then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	if itemEx.itemid == 8290 and itemEx.actionid == 8383 and (randomizer == 1) and queststatus3 == 1 then
		doSummonCreature("Wyrm", monster1)
		doSummonCreature("Wyrm", monster2)
		doSummonCreature("Ice Overlord", monster3)
		doSummonCreature("Roaring Water Elemental", monster4)
	elseif itemEx.itemid == 8290 and itemEx.actionid == 8383 and (randomizer == 2) and queststatus3 == 1 then
		doSummonCreature("Massive Water Elemental", monster1)
		doSummonCreature("Massive Water Elemental", monster2)
		doSummonCreature("Gladiator", monster3)
		doSummonCreature("Hellgorak", monster4)
	elseif itemEx.itemid == 8290 and itemEx.actionid == 8383 and (randomizer == 3) and queststatus3 == 1 then
		doSummonCreature("Hellspawn", monster1)
		doSummonCreature("Hand of Cursed Fate", monster2)
		doSummonCreature("Phantasm", monster3)
		doSummonCreature("Madareth", monster4)
		setPlayerStorageValue(cid,8383,-1)
		setPlayerStorageValue(cid,8484,1)
	elseif itemEx.itemid == 8290 and itemEx.actionid == 8383 and (randomizer >= 4) and queststatus3 == 1 then
		doSendMagicEffect(playerPos, 45)
		doCreatureAddHealth(cid, -300)
		doSendAnimatedText(playerPos, '300', TEXTCOLOR_LIGHTGREEN)
		end
	if itemEx.itemid == 8290 and itemEx.actionid == 8383 and queststatus3 == -1 then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	if itemEx.itemid == 8291 and itemEx.actionid == 8484 and (randomizer == 1) and queststatus4 == 1 then
		doSummonCreature("Orshabaal", monster1)
		doSummonCreature("The Count", monster2)
		doSummonCreature("Vampire Bride", monster3)
		doSummonCreature("Annihilon", monster4)
	elseif itemEx.itemid == 8291 and itemEx.actionid == 8484 and (randomizer == 2) and queststatus4 == 1 then
		doSummonCreature("The Count", monster1)
		doSummonCreature("Lost Soul", monster2)
		doSummonCreature("Grim Reaper", monster3)
		doSummonCreature("Zugurosh", monster4)
	elseif itemEx.itemid == 8291 and itemEx.actionid == 8484 and (randomizer == 3) and queststatus4 == 1 then
			doSummonCreature("Grim Reaper", monster1)
			doSummonCreature("Yalahar", monster2)
			doSummonCreature("Xenia", monster3)
			doSummonCreature("The Imperor", monster4)
		setPlayerStorageValue(cid,8484,-1)
		setPlayerStorageValue(cid,8585,1)
	elseif itemEx.itemid == 8291 and itemEx.actionid == 8484 and (randomizer >= 4) and queststatus4 == 1 then
		doSendMagicEffect(playerPos, 45)
		doCreatureAddHealth(cid, -300)
		doSendAnimatedText(playerPos, '300', TEXTCOLOR_LIGHTGREEN)
		end
	if itemEx.itemid == 8291 and itemEx.actionid == 8484 and queststatus4 == -1 then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
end
hallowedAxe:id(8293)
hallowedAxe:register()
