-- Magma Set Quest by TommyCrusher
local magmaLegs = Action()
function magmaLegs.onUse(cid, item, frompos, item2, topos)
if item.uid == 7894 then
  queststatus = getPlayerStorageValue(cid,7894)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles Magma Legs.")
   item_uid = doPlayerAddItem(cid,7894,1)
   setPlayerStorageValue(cid,7894,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
magmaLegs:uid(7894)
magmaLegs:register()
