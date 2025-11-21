local mask = Action()
function mask.onUse(cid, item, frompos, item2, topos)
	if (getPlayerStorageValue(cid, 19778) <= 0) then
    		if item.uid == 19778 and getPlayerLevel(cid) >= 200 then
		setPlayerStorageValue(cid, 19778, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You get pass to Yalahari Mask.")
    		end
    	return true
	end
end
mask:uid(19778)
mask:register()
