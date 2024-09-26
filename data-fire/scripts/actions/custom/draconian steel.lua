-- 10k Quest --
local dracoSteel = Action()
function dracoSteel.onUse(cid, item, frompos, item2, topos)
if item.uid == 1009 then
  queststatus = getPlayerStorageValue(cid,1009)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found 2 draconian steels.")
   item_uid = doPlayerAddItem(cid,5889,2)
   setPlayerStorageValue(cid,1009,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
dracoSteel:uid(1009)
dracoSteel:register()
