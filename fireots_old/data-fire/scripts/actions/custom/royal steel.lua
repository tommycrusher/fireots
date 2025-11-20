-- 10k Quest --
local royalSteel = Action()
function royalSteel.onUse(cid, item, frompos, item2, topos)
if item.uid == 1007 then
  queststatus = getPlayerStorageValue(cid,1007)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles 2 Royal Steel.")
   item_uid = doPlayerAddItem(cid,5887,2)
   setPlayerStorageValue(cid,1007,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(.")
  end
else
  return FALSE
end
return TRUE
end
royalSteel:uid(1007)
royalSteel:register()
