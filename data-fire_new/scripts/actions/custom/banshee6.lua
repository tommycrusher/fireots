-- pammy Quest --
local banshee6 = Action()
function banshee6.onUse(cid, item, frompos, item2, topos)
if item.uid == 1006 then
  queststatus = getPlayerStorageValue(cid,1006)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a platinum amulet.")
   item_uid = doPlayerAddItem(cid,2171,1)
   setPlayerStorageValue(cid,1006,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return false
end
return true
end
banshee6:uid(1006)
banshee6:register()
