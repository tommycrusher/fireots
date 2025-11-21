local warzone1 = Action()
function warzone1.onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 724877,
		bstorage = 924877, -- boss storage
		hours = 12
	}

	if getPlayerStorageValue(cid, config.bstorage) < 1 then
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Voce Precisa Matar o Deathstrike Antes de Abrir Este Bau.")
	end

	if getPlayerStorageValue(cid, config.storage) >= os.time() then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you have wait to "..os.date("%d %B %Y %X ", getPlayerStorageValue(cid,config.storage)).." to use this again.")
	end
			local bag = doPlayerAddItem(cid,18394,1)
			doAddContainerItem(bag,18402,1)
			doAddContainerItem(bag,18415,7)
			doAddContainerItem(bag,18396,1)
			doAddContainerItem(bag,18504,1)
			doAddContainerItem(bag,2160,3)
			doAddContainerItem(bag,18423,2)
		setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)
		setPlayerStorageValue(cid, config.bstorage,-1)
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found 2 major crystalline tokens, 1 gill necklace, 1 mucus plug , 7 green crystal shards and 3 crystal coins, wait "..config.hours.." hours to use this again.")
end
warzone1:uid(50551)
warzone1:register()
