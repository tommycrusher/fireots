-- Magma Set Quest by TommyCrusher
local magmaCoat = Action()
function magmaCoat.onUse(cid, item, frompos, item2, topos)
if item.uid == 7899 then
  queststatus = getPlayerStorageValue(cid,7899)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles Magma Coat.")
   item_uid = doPlayerAddItem(cid,7899,1)
   setPlayerStorageValue(cid,7899,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
magmaCoat:uid(7899)
magmaCoat:register()
