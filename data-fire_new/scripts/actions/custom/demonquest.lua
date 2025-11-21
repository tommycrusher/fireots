local demonicQuest = Action()
function demonicQuest.onUse(cid, item, frompos, item2, topos)
	gatepos = {x=532, y=687, z=10, stackpos=1}
	getgate = getThingfromPos(gatepos)
	if item.uid == 3002 and item.itemid == 2772 and getgate.itemid == 1355 then
		doRemoveItem(getgate.uid,1)
		doTransformItem(item.uid,item.itemid+1)
	elseif item.uid == 3002 and item.itemid == 2773 and getgate.itemid == 0 then
		doCreateItem(1355,1,gatepos)
		doTransformItem(item.uid,item.itemid-1)
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end
	return TRUE
end
demonicQuest:aid(3002)
demonicQuest:register()
