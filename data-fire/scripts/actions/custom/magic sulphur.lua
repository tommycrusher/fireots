-- 10k Quest --
local magicSulphur = Action()
function magicSulphur.onUse(cid, item, frompos, item2, topos)
if item.uid == 1008 then
  queststatus = getPlayerStorageValue(cid,1008)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found 3 magic sulphurs.")
   item_uid = doPlayerAddItem(cid,5904,3)
   setPlayerStorageValue(cid,1008,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return FALSE
end
return TRUE
end
magicSulphur:uid(1008)
magicSulphur:register()
