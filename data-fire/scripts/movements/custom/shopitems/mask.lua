local passYalahariMs = MoveEvent()
function passYalahariMs.onStepIn(cid, item, position, fromPosition)
	if (getPlayerStorageValue(cid, 19778) <= 0) then
    		if item.uid == 19778 and getPlayerLevel(cid) >= 200 then
		setPlayerStorageValue(cid, 19778, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You get pass to Yalahari Mask.")
    		end
    	return true
	end
end
passYalahariMs:uid(19778)
passYalahariMs:register()

