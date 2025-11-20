local passYalahariAs = MoveEvent()
function passYalahariAs.onStepIn(cid, item, position, fromPosition)
	if (getPlayerStorageValue(cid, 19776) <= 0) then
	    if item.uniqueid == 19776 and getPlayerLevel(cid) >= 200 then
			setPlayerStorageValue(cid, 19776, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You get pass to Yalahari Armor.")
	    end
	    return true
	end
end
passYalahariAs:type("stepin")
passYalahariAs:uid(19776)
passYalahariAs:register()
