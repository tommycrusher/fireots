local exhaustionEnable = true
local exhaustionStoragegnomevil = 35443
local exhaustionDelay = 20 * 60 * 60 -- seconds
local gnomevill = Action()
function gnomevill.onUse(cid, item, frompos, item2, topos)
	if item.uid == 35443 and (getPlayerStorageValue(cid, 35443) <= 0) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Mushroom Backpack.")
			local bag = doPlayerAddItem(cid,18393,1)
			doAddContainerItem(bag,18402,1)
			doAddContainerItem(bag,18413,10)
			doAddContainerItem(bag,18396,1)
			doAddContainerItem(bag,18508,1)
			doAddContainerItem(bag,2160,4)
			doAddContainerItem(bag,18423,2)
			setPlayerStorageValue(cid,exhaustionStoragegnomevil, os.time() + exhaustionDelay)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
		end	
	return TRUE
end
gnomevill:uid(35443)
gnomevill:register()

