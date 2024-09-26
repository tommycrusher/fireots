local jesterDollCollect = Action()
function jesterDollCollect.onUse(cid, item, frompos, item2, topos)

   	if item.uid == 9694 then
   		queststatus = getPlayerStorageValue(cid,9995)
   		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"You have found a head of Jester Doll.")
			doPlayerAddItem(cid,9694,1)
			setPlayerStorageValue(cid,9995,1)
   		else
   			doPlayerSendTextMessage(cid,22,"You began collect Jester Doll already.")
   		end
   	elseif item.uid == 9695 then
   		queststatus = getPlayerStorageValue(cid,9995)
   		if queststatus == 1 then
			doPlayerSendTextMessage(cid,22,"You have found a torso of Jester Doll.")
			doPlayerAddItem(cid,9695,1)
			setPlayerStorageValue(cid,9995,2)
   		else
    			doPlayerSendTextMessage(cid,22,"You began collect Jester Doll already.")
   		end
	elseif item.uid == 9696 then
   		queststatus = getPlayerStorageValue(cid,9995)
   		if queststatus == 2 then
			doPlayerSendTextMessage(cid,22,"You have found a left arm of Jester Doll.")
			doPlayerAddItem(cid,9696,1)
			setPlayerStorageValue(cid,9995,3)
   		else
   			doPlayerSendTextMessage(cid,22,"You began collect Jester Doll already.")
   		end

   	elseif item.uid == 9697 then
   		queststatus = getPlayerStorageValue(cid,9995)
   		if queststatus == 3 then
			doPlayerSendTextMessage(cid,22,"You have found a right arm of Jester Doll.")
			doPlayerAddItem(cid,9697,1)
			setPlayerStorageValue(cid,9995,4)
   		else
   			doPlayerSendTextMessage(cid,22,"You began collect Jester Doll already.")
   		end
	elseif item.uid == 9698 then
   		queststatus = getPlayerStorageValue(cid,9995)
   		if queststatus == 4 then
			doPlayerSendTextMessage(cid,22,"You have found a left leg of Jester Doll.")
			doPlayerAddItem(cid,8854,1)
			setPlayerStorageValue(cid,9995,5)
   		else
   			doPlayerSendTextMessage(cid,22,"You began collect Jester Doll already.")
   		end
   	elseif item.uid == 9699 then
   		queststatus = getPlayerStorageValue(cid,9995)
   		if queststatus == 4 then
			doPlayerSendTextMessage(cid,22,"You have found a right leg of Jester Doll.")
			doPlayerAddItem(cid,8918,1)
			setPlayerStorageValue(cid,9995,6)
   		else
   			doPlayerSendTextMessage(cid,22,"You began collect Jester Doll already.")
   		end
	else
		return FALSE
   	end
   	return TRUE
end
jesterDollCollect:uid(9694, 9695, 9696, 9697, 9698, 9699)
jesterDollCollect:register()
