local goldenTrophy = Action()
function goldenTrophy.onUse(cid, item, frompos, item2, topos)
if item.uid == 7369 then
  queststatus = getPlayerStorageValue(cid,9000)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found Golden Trophy.")
   item_uid = doPlayerAddItem(cid,7369,1)
   setPlayerStorageValue(cid,9000,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
goldenTrophy:uid(7369)
goldenTrophy:register()
