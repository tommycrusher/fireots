-- 10k Quest --
local chickenWing = Action()
function chickenWing.onUse(cid, item, frompos, item2, topos)
if item.uid == 1010 then
  queststatus = getPlayerStorageValue(cid,1010)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found 2 enchanted chicken wings.")
   item_uid = doPlayerAddItem(cid,5891,2)
   setPlayerStorageValue(cid,1010,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
chickenWing:uid(1010)
chickenWing:register()
