local entrepoi = Action()
function entrepoi.onUse(cid, item, frompos, item2, topos)
gatepos = {x=1140, y=1095, z=10, stackpos=1}
getgate = getThingfromPos(gatepos)
if item.itemid == 1409 then
doTeleportThing(cid, gatepos)
doSendMagicEffect(gatepos, 10)
end
return TRUE
end
entrepoi:id(1409)
entrepoi:register()
