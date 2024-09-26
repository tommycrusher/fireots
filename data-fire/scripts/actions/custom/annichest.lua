-- annihilator chests
local anniChest = Action()
function anniChest.onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5006 then
   		queststatus = getPlayerStorageValue(cid,5010)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Demon Armor.")
   			doPlayerAddItem(cid,2494,1)
   			setPlayerStorageValue(cid,5010,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5007 then
   		queststatus = getPlayerStorageValue(cid,5010)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Sword of Valor.")
   			doPlayerAddItem(cid,2400,1)
   			setPlayerStorageValue(cid,5010,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5008 then
   		queststatus = getPlayerStorageValue(cid,5010)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Stonecutter's Axe.")
   			doPlayerAddItem(cid,2431,1)
   			setPlayerStorageValue(cid,5010,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5009 then
   		queststatus = getPlayerStorageValue(cid,5010)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Teddy Bear.")
   			doPlayerAddItem(cid,2112,1)
   			setPlayerStorageValue(cid,5010,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return FALSE
   	end

   	return TRUE
end
anniChest:uid(5006,5007,5008,5009)
anniChest:register()
