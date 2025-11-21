-- Magma Set Quest by TommyCrusher
local elementalBow = Action()
function elementalBow.onUse(cid, item, frompos, item2, topos)
if item.uid == 8858 then
  queststatus = getPlayerStorageValue(cid,8858)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"Znalazles Elethriel's elemental Bow.")
   item_uid = doPlayerAddItem(cid,8858,1)
   setPlayerStorageValue(cid,8858,1)

  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
elementalBow:uid(8858)
elementalBow:register()
