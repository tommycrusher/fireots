-- Mechanic Scythe Quest by TommyCrusher
local mechanicScythe = Action()
function mechanicScythe.onUse(cid, item, frompos, item2, topos)
if item.uid == 7420 then
  queststatus = getPlayerStorageValue(cid,7420)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles Mechanic Scythe.")
   item_uid = doPlayerAddItem(cid,7420,1)
   setPlayerStorageValue(cid,7420,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
mechanicScythe:uid(7420)
mechanicScythe:register()
