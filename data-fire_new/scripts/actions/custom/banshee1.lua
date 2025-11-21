-- Boots of haste Quest --
local banshee1 = Action()
function banshee1.onUse(cid, item, frompos, item2, topos)
if item.uid == 1001 then
  queststatus = getPlayerStorageValue(cid,1001)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found slingshot.")
   item_uid = doPlayerAddItem(cid,5907,1)
   setPlayerStorageValue(cid,1001,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
banshee1:uid(1001)
banshee1:register()

