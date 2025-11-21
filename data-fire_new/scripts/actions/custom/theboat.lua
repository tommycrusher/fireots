velocidade = 400
pessoass = 1
local function move(paramis)
local npos = {x=centerpos.x+1, y=centerpos.y, z=centerpos.z, stackpos=1}
local getplayer = getThingfromPos(npos)
if getplayer.itemid == 4820 and getplayer.actionid ~= 100 then
doTeleportThing(paramis.cida, {x=centerpos.x+1, y=centerpos.y, z=centerpos.z})
centerpos = {x=centerpos.x+1, y=centerpos.y, z=centerpos.z}
addEvent(move,  velocidade, paramis)
doSetItemOutfit(paramis.cida, 2113, 6000)
else
local npos = {x=centerpos.x+1, y=centerpos.y, z=centerpos.z, stackpos=1}
local getplayer = getThingfromPos(npos)
if getplayer.itemid == 724 and getplayer.actionid ~= 100 then
doTeleportThing(paramis.cida, {x=centerpos.x+1, y=centerpos.y, z=centerpos.z})
centerpos = {x=centerpos.x+1, y=centerpos.y, z=centerpos.z}
addEvent(move,  velocidade, paramis)
doSetItemOutfit(paramis.cida, 2113, 6000)
else
doSetItemOutfit(paramis.cida, 2113, 1)
pessoass = 1

end
end
end
local theBoat = Action()
function theBoat.onUse(cid, item, frompos, item2, topos)
if pessoass == 1 then
local paramis = {cida = cid, poina = topos}
centerpos = topos
doTeleportThing(cid, centerpos)
doSetItemOutfit(cid, 2113, 1000)
addEvent(move,  400, paramis)
pessoass = 2
else
doSendAnimatedText(topos, "EYE!", TEXTCOLOR_RED)
doPlayerSendCancel(cid,'This is used.')
end
end
theBoat:uid(19000)
theBoat:register()
