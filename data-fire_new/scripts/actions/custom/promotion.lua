local promotion = Action()
function promotion.onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 2284 and getPlayerAccess(cid) == 5 then
	setPlayerPromotionLevel(itemEx.uid, 1)
	doSendMagicEffect(toPosition, 10)
	end
	return true
end
promotion:id(2284)
promotion:register()
