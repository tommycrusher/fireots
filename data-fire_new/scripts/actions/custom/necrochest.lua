-- annihilator chests
local necroChest = Action()
function necroChest.onUse(cid, item, frompos, item2, topos)

   	if item.uid == 7500 then
   		queststatus = getPlayerStorageValue(cid,7500)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Boots of Haste.")
   			doPlayerAddItem(cid,2195,1)
   			setPlayerStorageValue(cid,7500,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7501 then
   		queststatus = getPlayerStorageValue(cid,7501)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Blue Hat.")
   			doPlayerAddItem(cid,2663,1)
   			setPlayerStorageValue(cid,7501,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7502 then
   		queststatus = getPlayerStorageValue(cid,7502)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Blue Robe.")
   			doPlayerAddItem(cid,2656,1)
   			setPlayerStorageValue(cid,7502,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7503 then
   		queststatus = getPlayerStorageValue(cid,7503)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Blue Legs.")
   			doPlayerAddItem(cid,7730,1)
   			setPlayerStorageValue(cid,7503,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return false
   	end

   	return true
end
necroChest:uid(7500, 7501, 7502, 7503)
necroChest:register()
