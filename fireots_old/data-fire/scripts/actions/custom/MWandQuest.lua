local mwQuest = Action()
function mwQuest.onUse(cid, item, frompos, item2, topos)
local id = 7735
if (getPlayerStorageValue(cid,id) == -1) then
	doPlayerAddItem(cid,id,1)
	doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You get Magicial Wand with deadly consecuence.")
	setPlayerStorageValue(cid,id,1)
else
	doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You cannot do that two times!")
end
end
mwQuest:id(7955)
mwQuest:register()
