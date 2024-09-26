-- Magma Set Quest by TommyCrusher
local elvishBow = Action()
function elvishBow.onUse(cid, item, frompos, item2, topos)
if item.uid == 7438 then
  queststatus = getPlayerStorageValue(cid,7438)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles Elvish Bow.")
   item_uid = doPlayerAddItem(cid,7438,1)
   setPlayerStorageValue(cid,7438,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
elvishBow:uid(7438)
elvishBow:register()
