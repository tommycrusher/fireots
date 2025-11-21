-- Tower shield Quest --
local banshee2 = Action()
function banshee2.onUse(cid, item, frompos, item2, topos)
if item.uid == 1002 then
  queststatus = getPlayerStorageValue(cid,1002)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found bunnyslippers.")
   item_uid = doPlayerAddItem(cid,2644,1)
   setPlayerStorageValue(cid,1002,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
banshee2:uid(1002)
banshee2:register()

