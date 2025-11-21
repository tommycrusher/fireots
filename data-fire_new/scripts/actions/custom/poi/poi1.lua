-- poi1 Quest --
local poi1 = Action()
function poi1.onUse(cid, item, frompos, item2, topos)
if item.uid == 2358 then
  queststatus = getPlayerStorageValue(cid,6132)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a boots of waterwalking.")
   item_uid = doPlayerAddItem(cid,6132,1)
   setPlayerStorageValue(cid,6132,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
poi1:uid(2358)
poi1:register()
