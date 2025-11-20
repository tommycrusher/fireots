local pExp = Action()
function pExp.onUse(cid, item, frompos, item2, topos)
if item.uid == 9999 then
kasapos = {x=1028, y=994, z=10, stackpos=255}
getkasa = getThingfromPos(kasapos)
topos = {x=1024, y=994, z=10}
if getkasa.itemid == 3043 and getkasa.type == 20 then
doRemoveItem(getkasa.uid,20)  
doTeleportThing(cid,topos)
else
doPlayerSendTextMessage(cid,20,"Put 20 crystal coins on to coal basin.")
end
return TRUE
end
end
pExp:uid(9999)
pExp:register()
