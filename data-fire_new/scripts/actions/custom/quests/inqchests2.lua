local inqChests2 = Action()
function inqChests2.onUse(cid, item, fromPosition, itemEx, toPosition)
   	if item.uid == 5618 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found robe of the underworld.")
   			doPlayerAddItem(cid,8890,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 5612 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a  Spellbook of Dark Mysteries.")
   			doPlayerAddItem(cid,8918,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 5617 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Fireborn Giant Armor.")
   			doPlayerAddItem(cid,8881,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end
   	elseif item.uid == 5616 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Master Archer's Armor.")
   			doPlayerAddItem(cid,8888,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
  	elseif item.uid == 5610 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Royal Crossbow.")
   			doPlayerAddItem(cid,8851,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 5614 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Executioner.")
   			doPlayerAddItem(cid,7435,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 5615 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a The Stomper.")
   			doPlayerAddItem(cid,8929,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 5617 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Emerald Sword.")
   			doPlayerAddItem(cid,8930,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 5611 then
		queststatus = getPlayerStorageValue(cid,50301)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Warsinger Bow.")
   			doPlayerAddItem(cid,8854,1)
   			setPlayerStorageValue(cid,50301,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end

	end
   	return TRUE
end
inqChests2:uid(5610, 5611, 5612, 5614, 5615, 5616, 5617, 5618)
inqChests2:register()
