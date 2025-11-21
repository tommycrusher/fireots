local doqGrav = Action()
function doqGrav.onUse(cid, item, fromPosition, itemEx, toPosition)
newPosition  = {x=756, y=966, z=7} --- pos to prize room
winner = getPlayerStorageValue(cid,8585)
	if item.itemid == 1408 and winner == 1 then
		doTeleportThing(cid, newPosition, TRUE)
		doSendMagicEffect(newPosition, 10)
		setPlayerStorageValue(cid,8585,-1)
		end
	return TRUE
end
doqGrav:uid(55100)
doqGrav:register()
