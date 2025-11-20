local demonInvasion = Action()
function demonInvasion.onUse(cid, item, frompos, item2, topos)
playerpos = getPlayerPosition(cid)
orsh1pos = {x=103, y=2031, z=7}
demon2pos = {x=179, y=2042, z=7}
demon3pos = {x=136, y=2042, z=7}
demond4pos = {x=137, y=2041, z=7}
firelemental5pos = {x=134, y=2039, z=7}
firelemental6pos = {x=134, y=2049, z=7}
firelemental7pos = {x=140, y=2044, z=7}
firelemental8pos = {x=146, y=2039, z=7}
firelemental9pos = {x=151, y=2040, z=7}
firelemental10pos = {x=160, y=2038, z=7}
if item.uid == 9002 then
queststatus = getPlayerStorageValue(cid,9002)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"orshabaal.")
player2pos = {x=295, y=2039, z=7}
doTeleportThing(cid,player2pos)
doSummonCreature("Orshabaal", orsh1pos)
doSummonCreature("Demon", demon2pos)
doSummonCreature("Demon", demon3pos)
doSummonCreature("Demon", demon4pos)
doSummonCreature("Fire Elemental", firelemental5pos)
doSummonCreature("Fire Elemental", firelemental6pos)
doSummonCreature("Fire Elemental", firelemental7pos)
doSummonCreature("Fire Elemental", firelemental8pos)
doSummonCreature("Fire Elemental", firelemental9pos)
doSummonCreature("Fire Elemental", firelemental10pos)
doTeleportThing(cid,playerpos)
doSendMagicEffect(topos,12)
setPlayerStorageValue(cid,9002,1000)
else
doPlayerSendTextMessage(cid,22,"Nothing happens.")
end
return false
end
return true
end
demonInvasion:uid(9002)
demonInvasion:register()
