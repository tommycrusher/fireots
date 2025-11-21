local aslot = Action()
function aslot.onUse(cid, item, fromPosition, itemEx, toPosition)
	if not isCreature(itemEx.uid) then
		local desc = getItemName(itemEx.uid)
		local x, y = string.find(desc, '(.-) %[')
		if x ~= nil then
			doPlayerSendTextMessage(cid, 24, "You successful removed slots.")
			doItemSetAttribute(itemEx.uid, 'name', string.sub(desc, x, y-2))
			doRemoveItem(item.uid, 1)
		else
			doPlayerSendTextMessage(cid, 24, "You don't have any slot in this item.")
		end
	else
		doPlayerSendTextMessage(cid, 24, "You can't use it on that.")
	end
	return true
end
aslot:id(8302)
aslot:register()
