local secItemss = Action()
function secItemss.onUse(cid, item, frompos, item2, topos)
if item.uid == 2721 then
queststatus = getPlayerStorageValue(cid,2721)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"It's bonus for sorcerer!.")
doPlayerAddItem(cid,2191,1)
doPlayerAddItem(cid,2662,1)
doPlayerAddItem(cid,3975,1)
setPlayerStorageValue(cid,2721,1)
else
doPlayerSendTextMessage(cid,22,"You have taked bonus!")
end
else
return false
end
return true
end
secItemss:uid(2721)
secItemss:register()
