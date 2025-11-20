local bronzeTrophy = Action()
function bronzeTrophy.onUse(cid, item, frompos, item2, topos)
if item.uid == 7371 then
  queststatus = getPlayerStorageValue(cid,9002)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found Bronze Trophy.")
   item_uid = doPlayerAddItem(cid,7371,1)
   setPlayerStorageValue(cid,9002,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
bronzeTrophy:uid(7371)
bronzeTrophy:register()
