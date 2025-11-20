function onUse(cid, item, frompos, item2, topos)

if item.itemid == 1945 then
    if doPlayerRemoveMoney(cid, 100000) == true then
doPlayerGiveItemContainer(cid, 5926, 7440, 1, 100000)
doTransformItem(item.uid, item.itemid +1)
end
elseif item.itemid == 1946 then
    if doPlayerRemoveMoney(cid, 100000) == true then
doPlayerGiveItemContainer(cid, 5926, 7440, 1, 100000)
doTransformItem(item.uid, item.itemid -1)
end
else
doPlayerSendCancel(cid,"Sorry, you don't have enough money!")
end
return true
end
