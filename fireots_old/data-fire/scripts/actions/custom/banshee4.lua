-- gs Quest --
local banshee4 = Action()
function banshee4.onUse(cid, item, frompos, item2, topos)
if item.uid == 1004 then
  queststatus = getPlayerStorageValue(cid,1004)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found giant sword.")
   item_uid = doPlayerAddItem(cid,2393,1)
   setPlayerStorageValue(cid,1004,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end
banshee4:uid(1004)
banshee4:register()
