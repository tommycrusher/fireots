local quest = Action()

function quest.onUse(cid, item, frompos, item2, topos)
	prize = item.uid
	count = item.actionid

	if prize > 0 and prize < 13000 then
		queststatus = getPlayerStorageValue(cid,prize)

		if queststatus == -1 then
			if count > 1 then
				doPlayerSendTextMessage(cid,22,'You have found '.. count ..' of ' .. getItemName(prize) .. '.')
				doPlayerAddItem(cid,prize,count)
				setPlayerStorageValue(cid,prize,1)
                                --addPlayerRep(cid, 5, TEXTCOLOR_LIGHTBLUE)
			else
				doPlayerSendTextMessage(cid,22,'You have found a ' .. getItemName(prize) .. '.')
				doPlayerAddItem(cid,prize,1)
				setPlayerStorageValue(cid,prize,1)
                                --addPlayerRep(cid, 5, TEXTCOLOR_LIGHTBLUE)
			end
		else
			doPlayerSendTextMessage(cid,22,"It is empty.")
		end

		return TRUE
	else
		return FALSE
	end
end
quest:id(1740, 1747, 1748, 1749, 1770)
quest:register()
