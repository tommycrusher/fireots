-- poi1 Quest --
local poi2 = Action()
function poi2.onUse(cid, item, frompos, item2, topos)
if item.uid == 2361 then
  queststatus = getPlayerStorageValue(cid,2361)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a frozen starlight.")
   item_uid = doPlayerAddItem(cid,2361,1)
   setPlayerStorageValue(cid,2361,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
poi2:uid(2361)
poi2:register()
