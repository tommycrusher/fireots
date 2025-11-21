-- 10k Quest --
local banshee3 = Action()
function banshee3.onUse(cid, item, frompos, item2, topos)
if item.uid == 1003 then
  queststatus = getPlayerStorageValue(cid,1003)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found blessed shield.")
   item_uid = doPlayerAddItem(cid,2523,1)
   setPlayerStorageValue(cid,1003,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
banshee3:uid(1003)
banshee3:register()
