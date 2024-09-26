local arena = Action()
function arena.onUse(cid, item, frompos, item2, topos)

	if item.uid == 2217 and item.itemid == 1945 then
		player1pos = {x=81, y=2070, z=8, stackpos=253}
		player1 = getThingfromPos(player1pos)

		player2pos = {x=83, y=2070, z=8, stackpos=253}
		player2 = getThingfromPos(player2pos)

		if player1.itemid > 0 and player2.itemid > 0 then
			arenalevel = 50
			player1level = getPlayerLevel(player1.uid)
			player2level = getPlayerLevel(player2.uid)

			if player1level >= arenalevel and player2level >= arenalevel then
				for arenax = 74,89 do
					for arenay = 2072,2078 do
						arenapos = {x=arenax, y=arenay, z=8, stackpos=253}
						arenacreature = getThingfromPos(arenapos)

						if arenacreature.itemid > 0 then
							doPlayerSendCancel(cid,"Wait for current duel to end.")
							return 1
						end
					end
				end

				nplayer1pos = {x=78, y=2076, z=8}
				nplayer2pos = {x=86, y=2075, z=8}

				doSendMagicEffect(player1pos,2)
				doSendMagicEffect(player2pos,2)

				doTeleportThing(player1.uid,nplayer1pos)
				doTeleportThing(player2.uid,nplayer2pos)

				doSendMagicEffect(nplayer1pos,10)
				doSendMagicEffect(nplayer2pos,10)

				doPlayerSendTextMessage(player1.uid,18,"FIGHT!")
				doPlayerSendTextMessage(player2.uid,18,"FIGHT!")
			else
				doPlayerSendCancel(cid,"You must have a level 50.")
			end
		else
			doPlayerSendCancel(cid,"Must be two players.")
		end
	else
		return false
   	end

	return true
end
arena:uid(2217)
arena:register()
