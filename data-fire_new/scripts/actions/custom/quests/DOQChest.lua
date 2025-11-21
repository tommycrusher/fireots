local doqQuest = Action()
function doqQuest.onUse(player, item, fromPosition, target, toPosition, isHotkey)

   	if item.uid == 12901 then
   		queststatus = player:getStorageValue(50090)
   		if queststatus == -1 then
   			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a Demon Legs.")
   			player:addItem(2495,1)
   			player:setStorageValue(50090,1)
                                --addPlayerRep(player, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
   		end
   	elseif item.uid == 12902 then
   		queststatus = player:getStorageValue(50090)
   		if queststatus == -1 then
   			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a Rainbow Shield.")
   			player:addItem(8905,1)
   			player:setStorageValue(50090,1)
                                --addPlayerRep(player, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
   		end
   	elseif item.uid == 12903 then
   		queststatus = player:getStorageValue(50090)
   		if queststatus == -1 then
   			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a Spellbook of Enlightenment.")
   			player:addItem(8900,1)
   			player:setStorageValue(50090,1)
                                --addPlayerRep(player, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
   	elseif item.uid == 12904 then
   		queststatus = player:getStorageValue(50090)
   		if queststatus == -1 then
   			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a Royal Crossbow.")
   			player:addItem(8851,1)
   			player:setStorageValue(50090,1)
                                --addPlayerRep(player, 5, TEXTCOLOR_LIGHTBLUE)
   		else
   			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
   		end
	end
   	return TRUE
end
doqQuest:uid(12901, 12902, 12903, 12904)
doqQuest:register()
