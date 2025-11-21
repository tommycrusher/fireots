local epicDoor = Action()
function epicDoor.onUse(cid, item, frompos, item2, topos)

	if item.uid == 12345 then
		if getPlayerVocation(cid) == 9 or getPlayerVocation(cid) == 10 or getPlayerVocation(cid) == 11 or getPlayerVocation(cid) == 12 then
			doPlayerSendTextMessage(cid, 22, "You can pass, you are a Epic.")
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
			doPlayerSendTextMessage(cid,22,'You can\'t pass, you aren\'t a Epic.')
		end
		return TRUE
	else
		return FALSE
	end
end
epicDoor:uid(12345)
epicDoor:register()
