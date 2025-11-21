local infernal = Action()
function infernal.onUse(cid, item, frompos, item2, topos)
if item.uid == 9813 then
queststatus = getPlayerStorageValue(cid,9813)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found infernal bolt!.")
doPlayerAddItem(cid,6529,1)
setPlayerStorageValue(cid,9813,1)
else
doPlayerSendTextMessage(cid,22,"You maked this quest!")
end
else
return false
end
return true
end
infernal:uid(9813)
infernal:register()
