-- Magma Set Quest by TommyCrusher
local magmaBoots = Action()
function magmaBoots.onUse(cid, item, frompos, item2, topos)
if item.uid == 7891 then
  queststatus = getPlayerStorageValue(cid,7891)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles Magma Boots.")
   item_uid = doPlayerAddItem(cid,7891,1)
   setPlayerStorageValue(cid,7891,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
magmaBoots:uid(7891)
magmaBoots:register()
