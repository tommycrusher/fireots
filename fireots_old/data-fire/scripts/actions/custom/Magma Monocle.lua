-- Magma Set Quest by TommyCrusher
local magmaMonocle = Action()
function magmaMonocle.onUse(cid, item, frompos, item2, topos)
if item.uid == 7900 then
  queststatus = getPlayerStorageValue(cid,7900)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles Magma Monocle.")
   item_uid = doPlayerAddItem(cid,7900,1)
   setPlayerStorageValue(cid,7900,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
magmaMonocle:uid(7900)
magmaMonocle:register()
