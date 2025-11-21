local secItems = Action()
function secItems.onUse(cid, item, frompos, item2, topos)
if item.uid == 1354 then
queststatus = getPlayerStorageValue(cid,1354)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"It's bonus for knight!.")
doPlayerAddItem(cid,3975,1)
doPlayerAddItem(cid,2430,1)
doPlayerAddItem(cid,2434,1)
doPlayerAddItem(cid,2451,1)
setPlayerStorageValue(cid,1354,1)

else
doPlayerSendTextMessage(cid,22,"You have taked bonus!")
end
else
return false
end
return true
end
secItems:uid(1354)
secItems:register()






