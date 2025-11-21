local passHidden = MoveEvent()
function passHidden.onStepIn(cid, item, position, fromPosition)
	if (getPlayerStorageValue(cid, 8978) <= 0) then
	    if item.uniqueid == 8978 and getPlayerLevel(cid) >= 200 then
			setPlayerStorageValue(cid, 8978, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You get pass to Hidden Underground.")
	    end
	    return true
	end
end
passHidden:type("stepin")
passHidden:uid(8978)
passHidden:register()
