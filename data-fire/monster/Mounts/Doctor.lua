function onCast(cid, target)
     local master = getCreatureMaster(cid)
		if master then
		 local party = getPartyMembers(master)
		 local pos = getCreaturePosition(master)
		 if not getPlayerParty(master) then
			  doCreatureAddHealth(master, 50)
			  doSendMagicEffect(pos, 12)
			  return true
		 end
		 for _, todos in pairs(party) do
			  doCreatureAddHealth(todos, 50)
			  pos = getCreaturePosition(todos)
			  doSendMagicEffect(pos, 12)
		 end
		end
	return true
end