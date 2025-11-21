local mysticalQuest = Action()
function mysticalQuest.onUse(cid, item, frompos, item2, topos)
if item.uid == 7409 then
   		queststatus = getPlayerStorageValue(cid,7409)
                if queststatus == -1 or queststatus == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found Mystical Wand.")
                         item_uid = doPlayerAddItem(cid,7409,1)
   			setPlayerStorageValue(cid,7409,1)
  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
mysticalQuest:uid(7409)
mysticalQuest:register()
