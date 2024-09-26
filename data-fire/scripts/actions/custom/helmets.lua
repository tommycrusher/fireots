local helmets = Action()
function helmets.onUse(cid, item, frompos, item2, topos)
if item.uid == 1412 then
queststatus = getPlayerStorageValue(cid,1412)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You found HOTA!.")
doPlayerAddItem(cid,2343,1)
doPlayerAddItem(cid,2342,1)
setPlayerStorageValue(cid,1412,1)
else
doPlayerSendTextMessage(cid,22,"You maked this quest!")
end
else
return false
end
return true
end
helmets:uid(1412)
helmets:register()
