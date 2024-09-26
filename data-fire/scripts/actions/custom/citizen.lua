local citizen = Action()
function citizen.onUse(cid, item, pos)
	if isPlayer(cid) == TRUE then
		if (item.uid == 5101) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Enigma.")
			doPlayerSetTown(cid,1)
		elseif (item.uid == 5102) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Rhyves.")
			doPlayerSetTown(cid,2)
		elseif (item.uid == 5103) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Armonia.")
			doPlayerSetTown(cid,3)
		elseif (item.uid == 5104) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Ukryte Miasto.")
			doPlayerSetTown(cid,4)
		elseif (item.uid == 5105) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Ivllos.")
			doPlayerSetTown(cid,5)
		elseif (item.uid == 5106) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of GM Island.")
			doPlayerSetTown(cid,6)
		elseif (item.uid == 5107) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Yalahari.")
			doPlayerSetTown(cid,7)
		elseif (item.uid == 5108) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Trekolt.")
			doPlayerSetTown(cid,8)
		elseif (item.uid == 5109) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Varak.")
			doPlayerSetTown(cid,9)
		elseif (item.uid == 5110) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Jorvik.")
			doPlayerSetTown(cid,10)
		elseif (item.uid == 5111) then
			doPlayerSendTextMessage(cid,22,"You are now a citizen of Saund.")
			doPlayerSetTown(cid,11)
		end
	end
end
citizen:uid(5101, 5102, 5103, 5104, 5105, 5106, 5107, 5108, 5109, 5110, 5111)
citizen:register()
