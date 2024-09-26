local warzone2 = Action()
function warzone2.onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 724878,
		bstorage = 924878, -- boss storage
		hours = 12
	}

	if getPlayerStorageValue(cid, config.bstorage) < 1 then
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Voce Precisa Matar o Gnomevil Antes de Abrir Este Bau.")
	end

	if getPlayerStorageValue(cid, config.storage) >= os.time() then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but you have wait to "..os.date("%d %B %Y %X ", getPlayerStorageValue(cid,config.storage)).." to use this again.")
	end
			local bag = doPlayerAddItem(cid,18393,1)
			doAddContainerItem(bag,18402,1)
			doAddContainerItem(bag,18413,10)
			doAddContainerItem(bag,18396,1)
			doAddContainerItem(bag,18508,1)
			doAddContainerItem(bag,2160,4)
			doAddContainerItem(bag,18423,2)
		setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)
		setPlayerStorageValue(cid, config.bstorage,-1)
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found 2 major crystalline tokens, 1 prismatic necklace, 1 mucus plug , 10 blue crystal shards and 4 crystal coins, wait "..config.hours.." hours to use this again.")
end
warzone2:uid(50552)
warzone2:register()
