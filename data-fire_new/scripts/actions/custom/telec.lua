local telec = Action()
function telec.onUse(cid, item, frompos, item2, topos)
pos = {x=404, y=2464, z=7}
pos1 = {x=155, y=2028, z=7}
if item.itemid == 6536 then
doPlayerSendCancel(cid,"You are teleported!")
doTeleportThing(cid,pos)
doRemoveItem(item.uid,1)
else
doPlayerSendCancel(cid,"Nope!")
end

if item.itemid == 7633 then
doPlayerSendCancel(cid,"You are teleported!")
doTeleportThing(cid,pos)
doRemoveItem(item.uid,1)
else
doPlayerSendCancel(cid,"Nope :D!")
end

return true

end
telec:id(6536, 7633)
telec:register()
