local infernoBack = Action()
function infernoBack.onUse(cid, item, frompos, item2, topos)
if item.uid == 7966 then
if item.itemid == 1445 then

 nplayer1pos = {x=274, y=2047, z=9}

 doTeleportThing(cid,nplayer1pos)
doSendMagicEffect(nplayer1pos,10)

end
end
return true
end
infernoBack:uid(7966)
infernoBack:register()
