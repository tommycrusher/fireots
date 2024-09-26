local devilFlame = Action()
function devilFlame.onUse(cid, item, frompos, item2, topos)
if item.uid ==2328 then
queststatus = getPlayerStorageValue(cid,9002)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"This Chest is empty.")
 
else
doPlayerSendTextMessage(cid,22,"You finished a Flamebeast Quest!")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,8865,1)
setPlayerStorageValue(cid,9002,1)
end
return false
end
return true
end
devilFlame:uid(2328)
devilFlame:register()
