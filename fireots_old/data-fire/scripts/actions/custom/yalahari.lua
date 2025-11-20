local yalahariQuest = Action()
function yalahariQuest.onUse(cid, item, frompos, item2, topos)

voc = getPlayerVocation(cid)
queststatus = getPlayerStorageValue(cid,11566)


if voc == 1 then
if queststatus == -1 then
doPlayerAddItem(cid,2323,1)
setPlayerStorageValue(cid,11566,1)
else
doPlayerSendTextMessage(cid,22,"Do you done this quest.")
end
elseif voc == 2 then
if queststatus == -1 then
doPlayerAddItem(cid,2323,1)
setPlayerStorageValue(cid,11566,1)
else
doPlayerSendTextMessage(cid,22,"Do you done this quest.")
end
elseif voc == 3 then
if queststatus == -1 then
doPlayerAddItem(cid,2469,1)
setPlayerStorageValue(cid,11566,1)
else
doPlayerSendTextMessage(cid,22,"Do you done this quest.")
end
elseif voc == 4 then
if queststatus == -1 then
doPlayerAddItem(cid,8884,1)

setPlayerStorageValue(cid,11566,1)
doPlayerSendTextMessage(cid,22,"Do you done this quest.")
end
elseif voc == 5 then
if queststatus == -1 then
doPlayerAddItem(cid,2323,1)

setPlayerStorageValue(cid,11566,1)
doPlayerSendTextMessage(cid,22,"Do you done this quest.")
end
elseif voc == 6 then
if queststatus == -1 then
doPlayerAddItem(cid,2323,1)

setPlayerStorageValue(cid,11566,1)
doPlayerSendTextMessage(cid,22,"Do you done this quest.")
end
elseif voc == 7 then
if queststatus == -1 then
doPlayerAddItem(cid,2469,1)

setPlayerStorageValue(cid,11566,1)
doPlayerSendTextMessage(cid,22,"Do you done this quest.")
end
elseif voc == 8 then
if queststatus == -1 then
doPlayerAddItem(cid,8884,1)

setPlayerStorageValue(cid,11566,1) else
doPlayerSendTextMessage(cid,22,"Do you done this quest.")
end
else
return false
end

return true
end
yalahariQuest:aid(3542)
yalahariQuest:register()
