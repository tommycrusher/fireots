local dslQuest = Action()
function dslQuest.onUse(cid, item, frompos, item2, topos)
if item.uid == 1417 then
queststatus = getPlayerStorageValue(cid,1417)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found Dragon scale legs!.")
doPlayerAddItem(cid,2469,1)
doPlayerAddItem(cid,2660,1)
setPlayerStorageValue(cid,1417,1)
else
doPlayerSendTextMessage(cid,22,"You maked this quest!")
end
else
return false
end
return true
end
dslQuest:uid(1417)
dslQuest:register()
