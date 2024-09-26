local exhaustionEnable = true
local exhaustionStoragedeathstrike = 35445
local exhaustionDelay = 20 * 60 * 60 -- seconds
local deathStrike = Action()
function deathStrike.onUse(cid, item, frompos, item2, topos)
	if item.uid == 35445 and (getPlayerStorageValue(cid, 35445) <= 0) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Crystal Backpack.")
			local bag = doPlayerAddItem(cid,18394,1)
			doAddContainerItem(bag,18402,1)
			doAddContainerItem(bag,18415,7)
			doAddContainerItem(bag,18396,1)
			doAddContainerItem(bag,18504,1)
			doAddContainerItem(bag,2160,3)
			doAddContainerItem(bag,18423,2)
			setPlayerStorageValue(cid,exhaustionStoragedeathstrike, os.time() + exhaustionDelay)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
		end	
	return TRUE
end
deathStrike:uid(35445)
deathStrike:register()
