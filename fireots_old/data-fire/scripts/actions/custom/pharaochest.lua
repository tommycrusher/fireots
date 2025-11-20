-- pharaon quest chests
local pharaoChest = Action()
function pharaoChest.onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5003 then
   		queststatus = getPlayerStorageValue(cid,5003)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Pharao Sword.")
			doPlayerAddItem(cid,2446,1)
			setPlayerStorageValue(cid,5003,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5004 then
   		queststatus = getPlayerStorageValue(cid,5003)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Pharao Halberd.")
			doPlayerAddItem(cid,2443,1)
			setPlayerStorageValue(cid,5003,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 5017 then
   		queststatus = getPlayerStorageValue(cid,5003)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Hammer of the Wrath.")
			doPlayerAddItem(cid,2444,1)
			setPlayerStorageValue(cid,5003,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return FALSE
   	end

   	return TRUE
end
pharaoChest:uid(5003, 5004, 5017)
pharaoChest:register()
