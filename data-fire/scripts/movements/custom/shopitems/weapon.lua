local passWeapons = MoveEvent()
function passWeapons.onStepIn(cid, item, position, fromPosition)
	if (getPlayerStorageValue(cid, 19000) <= 0) then
	    if item.uniqueid == 19000 and getPlayerLevel(cid) >= 200 then
			setPlayerStorageValue(cid, 19000, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You get pass to Weapon.")
	    end
	    return true
	end
end
passWeapons:uid(19000)
passWeapons:register()
