local pDoor = Action()
function pDoor.onUse(cid, item, frompos, item2, topos)
reqvoc = getPlayerVocation(cid)
if item.uid == 8200 then
if reqvoc == 3 then
pos = getPlayerPosition(cid)

if pos.x == topos.x then
if pos.y < topos.y then
pos.y = topos.y + 1
else
pos.y = topos.y - 1
end
elseif pos.y == topos.y then
if pos.x < topos.x then
pos.x = topos.x + 1
else
pos.x = topos.x - 1
end
else
doPlayerSendTextMessage(cid,22,'Stand in front of the door.')
return true
end

doTeleportThing(cid,pos)
doSendMagicEffect(topos,12)
else
doPlayerSendTextMessage(cid,22,'Only Paladin can go.')
end
return true
else
return false
end
end
pDoor:uid(8200)
pDoor:register()
