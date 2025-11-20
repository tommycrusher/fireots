function onUse(cid, item, position, fromPosition, item2, toPosition)

local monstername1 = "Snake God Essence" -- Nome dos monstros que serão sumonados após o player clicar no item!
local monstername2 = "Snake Thing" -- Nome dos monstros que serão sumonados após o player clicar no item!
local monstername3 = "Lizard Abomination" -- Nome dos monstros que serão sumonados após o player clicar no item!
local monstername4 = "Mutated Zalamon" -- Nome dos monstros que serão sumonados após o player clicar no item!

local monster1 = {x=33360,y=31406,z=10} -- Coordenas de a onde o monstro irá aparecer!
local monster2 = {x=33360,y=31406,z=10} -- Coordenas de a onde o monstro irá aparecer!
local monster3 = {x=33360,y=31406,z=10} -- Coordenas de a onde o monstro irá aparecer!
local monster4 = {x=33360,y=31406,z=10} -- Coordenas de a onde o monstro irá aparecer!

local pos = {x=33358,y=31408,z=10} -- local para onde os players serão teleportados
local fromPosition,toPosition = {x=33352,y=31401,z=9},{x=33367,y=31414,z=9} -- canto superior esquerdo, canto inferior direito

for x = fromPosition.x, toPosition.x do
for y = fromPosition.y, toPosition.y do
local m = getTopCreature({x=x, y=y, z=fromPosition.z}).uid
if m ~= 0 and isPlayer(m) then
doTeleportThing(m, pos)
end
end
end

function Summon()
doSummonCreature(monstername1,monster1)
end
function Summon2()
doSummonCreature(monstername2,monster2)
end
function Summon3()
doSummonCreature(monstername3,monster3)
end
function Summon4()
doSummonCreature(monstername4,monster4)
end

doCreatureSay(cid,"You went in the wrong place, beware!",TALKTYPE_ORANGE_1)
addEvent(Summon,100)
addEvent(Summon2,60000)
addEvent(Summon3,120000)
addEvent(Summon4,180000)
end