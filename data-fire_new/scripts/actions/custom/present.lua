local present = Action()
function present.onUse(cid, item, fromPosition, itemEx, toPosition)
	if(not checkExhausted(cid, 103, 5)) then
		return true
	end
	local gifts = {7958, 7450, 9931, 8880, 7697, 8858, 2538, 2437, 2508, 2352, 7416, 2644, 9778, 8865, 8890, 3983, 9933, 7735, 8306, 2506, 8888, 9777, 8850, 6529, 6433, 8903, 2496, 9776, 2469, 6391, 8925, 7422, 2390, 7722}
	doPlayerAddItem(cid, gifts[math.random(#gifts)], 1)
	doDecayItem(item.uid)
	doSendMagicEffect(toPosition, 12)
	local playerpos = getCreaturePosition(cid)
                doRemoveItem(item.uid, 1)
	return true
end
present:id(9941)
present:register()
