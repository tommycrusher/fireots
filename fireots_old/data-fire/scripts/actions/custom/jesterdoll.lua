local jesterDoll = Action()
function jesterDoll.onUse(cid, item, frompos, item2, topos)
	if item.uid == 9995 and item.itemid == 1945 then
		piece1pos = {x=1096, y=878, z=7, stackpos=1}
		piece2pos = {x=1097, y=878, z=7, stackpos=1}
		piece3pos = {x=1098, y=878, z=7, stackpos=1}
		piece4pos = {x=1099, y=878, z=7, stackpos=1}
		piece5pos = {x=1100, y=878, z=7, stackpos=1}
		piece6pos = {x=1101, y=878, z=7, stackpos=1}
		dollpos = {x=1099, y=880, z=7, stackpos=1}
		getpiece1 = getThingfromPos(piece1pos)
		getpiece2 = getThingfromPos(piece2pos)
		getpiece3 = getThingfromPos(piece3pos)
		getpiece4 = getThingfromPos(piece4pos)
		getpiece5 = getThingfromPos(piece5pos)
		getpiece6 = getThingfromPos(piece6pos)
		if getpiece1.itemid == 9698 and getpiece2.itemid == 9699 and getpiece3.itemid == 9695 and getpiece4.itemid == 9696 and getpiece5.itemid == 9697 and getpiece6.itemid == 9694 then
			doRemoveItem(getpiece1.uid,1)
			doRemoveItem(getpiece2.uid,1)
			doRemoveItem(getpiece3.uid,1)
			doRemoveItem(getpiece4.uid,1)
			doRemoveItem(getpiece5.uid,1)
			doRemoveItem(getpiece6.uid,1)
			doCreateItem(9693,1,dollpos)
			setPlayerStorageValue(cid, 12346, 1)
			doTransformItem(item.uid,item.itemid+1)
		elseif item.uid == 9995 and item.itemid == 1946 then
			doTransformItem(item.uid,item.itemid-1)
		else
			doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
		end
	end
	return true
end
jesterDoll:uid(9995)
jesterDoll:register()
