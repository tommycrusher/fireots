local poiwall5 = Action()
function poiwall5.onUse(cid, item, frompos, item2, topos)
gatepos = {x=1113, y=1127, z=10, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 3005 and item.itemid == 1945 and getgate.itemid == 1304 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 3005 and item.itemid == 1946
and getgate.itemid == 0 then
doCreateItem(1304,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
return TRUE
end
poiwall5:uid(3005)
poiwall5:register()
