local silverTrophy = Action()
function silverTrophy.onUse(cid, item, frompos, item2, topos)
if item.uid == 7370 then
  queststatus = getPlayerStorageValue(cid,9001)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found Silver Trophy.")
   item_uid = doPlayerAddItem(cid,7370,1)
   setPlayerStorageValue(cid,9001,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
silverTrophy:uid(7370)
silverTrophy:register()
