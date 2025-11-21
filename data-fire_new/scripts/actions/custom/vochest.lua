local vocChest = Action()
function vocChest.onUse(cid, item, frompos, item2, topos)

voc = getPlayerVocation(cid)
queststatus = getPlayerStorageValue(cid,11554)


if voc == 1 then
if queststatus == -1 then
doPlayerAddItem(cid,2152,100)
doPlayerAddItem(cid,8820,1)
doPlayerAddItem(cid,8819,1)
doPlayerAddItem(cid,2647,1)
doPlayerAddItem(cid,2190,1)
doPlayerAddItem(cid,2175,1)
setPlayerStorageValue(cid,11554,1)
else
doPlayerSendTextMessage(cid,22,"To jest puste.")
end
elseif voc == 2 then
if queststatus == -1 then
doPlayerAddItem(cid,2152,100)
doPlayerAddItem(cid,8820,1)
doPlayerAddItem(cid,8819,1)
doPlayerAddItem(cid,2647,1)
doPlayerAddItem(cid,2175,1)
doPlayerAddItem(cid,2182,1)
setPlayerStorageValue(cid,11554,1)
else
doPlayerSendTextMessage(cid,22,"To jest puste.")
end
elseif voc == 3 then
if queststatus == -1 then
doPlayerAddItem(cid,2152,100)
doPlayerAddItem(cid,8872,1)
doPlayerAddItem(cid,2457,1)
doPlayerAddItem(cid,2647,1)
doPlayerAddItem(cid,2525,1)
doPlayerAddItem(cid,2389,1)
setPlayerStorageValue(cid,11554,1)
else
doPlayerSendTextMessage(cid,22,"To jest puste.")
end
elseif voc == 4 then
if queststatus == -1 then
doPlayerAddItem(cid,2152,100)
doPlayerAddItem(cid,2457,1)
doPlayerAddItem(cid,2463,1)
doPlayerAddItem(cid,2647,1)
doPlayerAddItem(cid,2525,1)
doPlayerAddItem(cid,2428,1)
doPlayerAddItem(cid,2417,1)
doPlayerAddItem(cid,3963,1)

setPlayerStorageValue(cid,11554,1) else
doPlayerSendTextMessage(cid,22,"To jest puste.")
end
else
return false
end

return true
end
vocChest:aid(3540)
vocChest:register()
