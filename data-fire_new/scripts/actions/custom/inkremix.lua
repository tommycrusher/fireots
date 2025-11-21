-- pharaon quest chests
local inkremix = Action()
function inkremix.onUse(cid, item, frompos, item2, topos)

   	if item.uid == 9600 then
   		queststatus = getPlayerStorageValue(cid,9600)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Blacksteel Sword.")
			doPlayerAddItem(cid,7406,1)
			setPlayerStorageValue(cid,9600,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 9601 then
   		queststatus = getPlayerStorageValue(cid,9600)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Orcish Maul.")
			doPlayerAddItem(cid,7392,1)
			setPlayerStorageValue(cid,9600,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 9602 then
   		queststatus = getPlayerStorageValue(cid,9600)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Headchoper.")
			doPlayerAddItem(cid,7380,1)
			setPlayerStorageValue(cid,9600,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

   	elseif item.uid == 8206 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Orcish Maul.")
			doPlayerAddItem(cid,8852,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 8207 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Headchoper.")
			doPlayerAddItem(cid,8854,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 8208 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Orcish Maul.")
			doPlayerAddItem(cid,8918,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 8209 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Headchoper.")
			doPlayerAddItem(cid,8930,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 8210 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Orcish Maul.")
			doPlayerAddItem(cid,8924,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 8211 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Headchoper.")
			doPlayerAddItem(cid,8928,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 8212 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Orcish Maul.")
			doPlayerAddItem(cid,8888,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 8213 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Headchoper.")
			doPlayerAddItem(cid,8881,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 8214 then
   		queststatus = getPlayerStorageValue(cid,8206)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Headchoper.")
			doPlayerAddItem(cid,8890,1)
			setPlayerStorageValue(cid,8206,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return FALSE
   	end

   	return TRUE
end
inkremix:uid(9600, 9601, 9602, 8206, 8207, 8208, 8209, 8210, 8211, 8212, 8213, 8214)
inkremix:register()
