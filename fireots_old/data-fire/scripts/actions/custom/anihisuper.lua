-- annihilator chests
local anniSuper = Action()
function anniSuper.onUse(cid, item, frompos, item2, topos)

   	if item.uid == 3841 then
   		queststatus = getPlayerStorageValue(cid,3737)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Demon Legs.")
   			doPlayerAddItem(cid,2495,1)
   			setPlayerStorageValue(cid,3737,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 3842 then
   		queststatus = getPlayerStorageValue(cid,3737)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Helmet of the Ancients.")
   			doPlayerAddItem(cid,2343,1)
   			setPlayerStorageValue(cid,3737,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 3843 then
   		queststatus = getPlayerStorageValue(cid,3737)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Golden Boots.")
   			doPlayerAddItem(cid,2646,1)
   			setPlayerStorageValue(cid,3737,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5009 then
   		queststatus = getPlayerStorageValue(cid,3737)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Thunder Hammer.")
   			doPlayerAddItem(cid,2421,1)
   			setPlayerStorageValue(cid,3737,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return false
   	end

   	return true
end
anniSuper:uid(3841,3842,3843)
anniSuper:register()

