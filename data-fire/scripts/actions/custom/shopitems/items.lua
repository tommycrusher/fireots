-- pharaon quest chests
local yitems = Action()
function yitems.onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5915 then
   		queststatus = getPlayerStorageValue(cid,5915)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Yalahari Leg Piece.")
			doPlayerAddItem(cid,9777,1)
			setPlayerStorageValue(cid,5915,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5916 then
   		queststatus = getPlayerStorageValue(cid,5915)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Yalahari Armor.")
			doPlayerAddItem(cid,9776,1)
			setPlayerStorageValue(cid,5915,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 5917 then
   		queststatus = getPlayerStorageValue(cid,5915)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a Yalahari Mask.")
			doPlayerAddItem(cid,9778,1)
			setPlayerStorageValue(cid,5915,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return FALSE
   	end

   	return TRUE
end
yitems:uid(5915, 5916, 5917)
yitems:register()
