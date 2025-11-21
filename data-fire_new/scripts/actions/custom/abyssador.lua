local exhaustionEnable = true
local exhaustionStorageabyssador = 35441
local exhaustionDelay = 20 * 60 * 60 -- seconds
local abbysador = Action()
function abbysador.onUse(cid, item, frompos, item2, topos)
	if item.uid == 35441 and (getPlayerStorageValue(cid, 35441) <= 0) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Mushroom Backpack.")
			local bag = doPlayerAddItem(cid,18393,1)
			doAddContainerItem(bag,18402,1)
			doAddContainerItem(bag,18414,12)
			doAddContainerItem(bag,18396,1)
			doAddContainerItem(bag,18500,1)
			doAddContainerItem(bag,2160,5)
			doAddContainerItem(bag,18423,2)
			setPlayerStorageValue(cid,exhaustionStorageabyssador, os.time() + exhaustionDelay)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
		end	
	return TRUE
end
abbysador:uid(35441)
abbysador:register()


