local vampiricCrest = Action()
function vampiricCrest.onUse(cid, item, frompos, item2, topos)

if item.uid == 9955 then
   		queststatus = getPlayerStorageValue(cid,9955)
                if queststatus == -1 or queststatus == 0 then
   			doPlayerSendTextMessage(cid,22,"You have found first Vampiric Crest!.")
                        item_uid = doPlayerAddItem(cid,9955,1)
   			setPlayerStorageValue(cid,9955,1)
  else
   doPlayerSendTextMessage(cid,22,"pusto :(")
  end
else
  return FALSE
end
return TRUE
end
vampiricCrest:uid(9955)
vampiricCrest:register()
