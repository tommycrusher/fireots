local godsShields = MoveEvent()
function godsShields.onStepIn(cid, item, position, fromPosition)
	if (getPlayerStorageValue(cid, 12517) <= 0) then
	    if item.uid == 12517 and getPlayerLevel(cid) >= 200 then
			setPlayerStorageValue(cid, 12517, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You get pass to GODS Shield.")
	    end
	    return true
	end
end
godsShields:type("stepin")
godsShields:uid(12517)
godsShields:register()

