local poistone4 = Action()
function poistone4.onUse(cid, item, frompos, item2, topos)
gatepos = {x=1169, y=1134, z=10, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.uid == 3009 and item.itemid == 1945 and getgate.itemid == 3361 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 3009 and item.itemid == 1946
and getgate.itemid == 0 then
doCreateItem(3361,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
return TRUE
end
poistone4:uid(3009)
poistone4:register()
