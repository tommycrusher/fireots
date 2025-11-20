-- SSA Quest --
local banshee5 = Action()
function banshee5.onUse(cid, item, frompos, item2, topos)
if item.uid == 1005 then
  queststatus = getPlayerStorageValue(cid,1005)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a stone skin amulet.")
   item_uid = doPlayerAddItem(cid,2197,1)
   setPlayerStorageValue(cid,1005,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
banshee5:uid(1005)
banshee5:register()
