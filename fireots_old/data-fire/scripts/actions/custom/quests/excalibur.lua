local excalibur = Action()
function excalibur.onUse(cid, item, fromPosition, itemEx, toPosition)
   	if item.uid == 65500 then
		queststatus = getPlayerStorageValue(cid,65500)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found Excalibur.")
   			doPlayerAddItem(cid,8980,1)
   			setPlayerStorageValue(cid,50301,1)
                                --addPlayerRep(cid, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 65501 then
		queststatus = getPlayerStorageValue(cid,65501)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Crystal Arrow.")
   			doPlayerAddItem(cid,2352,1)
   			setPlayerStorageValue(cid,50301,1)
                                --addPlayerRep(cid, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 65502 then
		queststatus = getPlayerStorageValue(cid,65502)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Star Wand.")
   			doPlayerAddItem(cid,7735,1)
   			setPlayerStorageValue(cid,50301,1)
                                addPlayerRep(cid, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end
	end
   	return TRUE
end
excalibur:uid(65500, 65501, 65502)
excalibur:register()
