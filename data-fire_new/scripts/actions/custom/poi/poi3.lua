-- poi 10k Quest --
local poi3 = Action()
function poi3.onUse(cid, item, frompos, item2, topos)
if item.uid == 1111 then
  queststatus = getPlayerStorageValue(cid,1111)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found 100 platinum coins.")
   item_uid = doPlayerAddItem(cid,2152,100)
   setPlayerStorageValue(cid,1111,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
poi3:uid(1111)
poi3:register()
