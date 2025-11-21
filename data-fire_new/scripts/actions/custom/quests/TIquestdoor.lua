local tlqQuest = Action()
function tlqQuest.onUse(cid, item, frompos, item2, topos)
	if item.uid == 12347 then
		if getPlayerStorageValue(cid, 12347) == 6 and checkArea(frompos) then
			doPlayerSendTextMessage(cid, 22, "You can pass, you done Trading Items Quest")
			pos = getPlayerPosition(cid)
			if pos.x == topos.x then
				if pos.y < topos.y then
					pos.y = topos.y + 1
				else
					pos.y = topos.y - 1
				end
			elseif pos.y == topos.y then
				if pos.x < topos.x then
					pos.x = topos.x + 1
				else
					pos.x = topos.x - 1
				end
			else
				doPlayerSendTextMessage(cid,22,'Please stand in front of the door.')
				return TRUE
			end
		doTeleportThing(cid,pos)
		doSendMagicEffect(topos,12)
		else
			doPlayerSendTextMessage(cid,22,'You can\'t pass, someone is in the room or you haven\'t done Trading Items Quest.')
		end
			return TRUE
		else
			return FALSE
	end
end
tlqQuest:uid(12347)
tlqQuest:register()
