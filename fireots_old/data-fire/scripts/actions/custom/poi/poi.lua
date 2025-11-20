local poi = Action()
function poi.onUse(cid, item, frompos, item2, topos)
local poi_status = getPlayerStorageValue(cid, 9000)
if(item.uid == 2000) then
if(poi_status == -1) then
doPlayerAddItem(cid, 5803, 1)
setPlayerStorageValue(cid, 9000, 1)
doPlayerSendTextMessage(cid, 22, "You have found an arblest.")
else doPlayerSendTextMessage(cid, 22, "It is empty.")
end
elseif(item.uid == 2001) then
if(poi_status == -1) then
doPlayerAddItem(cid, 6528, 1)
setPlayerStorageValue(cid, 9000, 1)
doPlayerSendTextMessage(cid, 22, "You have found a avenger.")
else
doPlayerSendTextMessage(cid, 22, "It is empty.")
end
elseif(item.uid == 2002) then
if(poi_status == -1) then
doPlayerAddItem(cid, 2453, 1)
setPlayerStorageValue(cid, 9000, 1)
doPlayerSendTextMessage(cid, 22, "You have found a arcane staff.")
else
doPlayerSendTextMessage(cid, 22, "It is empty.")
end
end
return TRUE
end
poi:uid(2000, 2001, 2002)
poi:register()
