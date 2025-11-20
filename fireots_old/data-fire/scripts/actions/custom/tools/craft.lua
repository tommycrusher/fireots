function onUse(cid, item, frompos, item2, topos)

	leverpos = {x=152, y=61, z=6, stackpos=2}
	orepos1 = {x=151, y=61, z=6, stackpos=255}
	lever = getThingfromPos(leverpos)
	ore = getThingfromPos(orepos1)
	rand = math.random(1,400)
if ore.itemid == 2225 and item.itemid == 1946 then
	doTransformItem(item.uid,item.itemid-1)
elseif ore.itemid == 2225 and item.itemid == 1945 then
	doTransformItem(item.uid,item.itemid+1)
	end

	if ore.itemid == 2225 and rand > 111 then
		doRemoveItem(ore.uid,1)
		doCreateItem(2223,1,orepos1)
				doSendMagicEffect(orepos1,17)
	
	elseif ore.itemid == 2225 and rand > 0 and rand < 7 then
		doCreateItem(2645,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)

	elseif ore.itemid == 2225 and rand > 10 and rand < 16 then
		doCreateItem(2662,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 15 and rand < 18 then
		doCreateItem(3969,1,orepos1)
		doRemoveItem(ore.uid,1)
doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 17 and rand < 21 then
		doCreateItem(2503,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 20 and rand < 23 then
		doCreateItem(2504,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 27 and rand < 30 then
		doCreateItem(2508,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 29 and rand < 51 then
		doCreateItem(2457,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 50 and rand < 71 then
		doCreateItem(2528,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 70 and rand < 73 then
		doCreateItem(2528,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 72 and rand < 75 then
		doCreateItem(2546,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 92 and rand < 95 then
		doCreateItem(3964,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 94 and rand < 97 then
		doCreateItem(3965,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand == 96 then
		doCreateItem(2402,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)

	elseif ore.itemid == 2225 and rand > 99 and rand < 101 then
		doCreateItem(2195,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 100 and rand < 102 then
		doCreateItem(2656,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 101 and rand < 104 then
		doCreateItem(2656,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 105 and rand < 107 then
		doCreateItem(2656,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2157 and rand > 50 then
		doCreateItem(2122,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 106 and rand < 108 then
		doCreateItem(3966,1,orepos1)
		doRemoveItem(ore.uid,1)
	elseif ore.itemid == 2225 and rand > 107 and rand < 109 then
		doCreateItem(2663,1,orepos1)
		doRemoveItem(ore.uid,1)

	elseif ore.itemid == 2225 and rand > 108 and rand < 110 then
		doCreateItem(2466,1,orepos1)
		doRemoveItem(ore.uid,1)

	elseif ore.itemid == 2225 and rand > 109 and rand < 111 then
		doCreateItem(2476,1,orepos1)
		doRemoveItem(ore.uid,1)
	elseif ore.itemid == 2225 and rand > 110 and rand < 112 then
		doCreateItem(2520,1,orepos1)
		doRemoveItem(ore.uid,1)
	elseif ore.itemid == 2157 and rand > 50 then
		doCreateItem(2492,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)
	elseif ore.itemid == 2225 and rand > 105 and rand < 107 then
		doCreateItem(2472,1,orepos1)
		doRemoveItem(ore.uid,1)
				doSendMagicEffect(orepos1,10)






	end
return TRUE
end
