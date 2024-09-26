local train = Action()
function train.onUse(cid, item, frompos, item2, topos)

if item.uid == 8000 then
kasapos = {x=1038, y=1012, z=8, stackpos=255}
getkasa = getThingfromPos(kasapos)
topos = {x=1026, y=904, z=7}

if getkasa.itemid == 2160 and getkasa.type == 20 then
doRemoveItem(getkasa.uid,20)  
doTeleportThing(cid,topos)

else
doPlayerSendTextMessage(cid,20,"Put 20 crystal coins on to coal basin.")
end


return TRUE
end
end
train:uid(8000)
train:register()
