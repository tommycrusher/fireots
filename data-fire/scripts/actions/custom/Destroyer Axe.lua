-- Magma Set Quest by TommyCrusher
local destroyerAxe = Action()
function destroyerAxe.onUse(cid, item, frompos, item2, topos)
if item.uid == 7454 then
  queststatus = getPlayerStorageValue(cid,7454)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles Destroyer Axe.")
   item_uid = doPlayerAddItem(cid,7454,1)
   setPlayerStorageValue(cid,7454,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
destroyerAxe:uid(7454)
destroyerAxe:register()
