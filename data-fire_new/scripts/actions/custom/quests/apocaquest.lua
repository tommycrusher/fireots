local apocaQuest = Action()
function apocaQuest.onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 17756 then
   		queststatus = getPlayerStorageValue(cid,50090)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found Spirit cloak.")
   			doPlayerAddItem(cid,8870,1)
   			setPlayerStorageValue(cid,50090,1)
                                addPlayerRep(cid, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	end

   	if item.uid == 17757 then
   		queststatus = getPlayerStorageValue(cid,50077)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found greenwood coat.")
   			doPlayerAddItem(cid,8869,1)
   			setPlayerStorageValue(cid,50077,1)
                                addPlayerRep(cid, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	end
   	return true
end
apocaQuest:uid(17756, 17757)
apocaQuest:register()
