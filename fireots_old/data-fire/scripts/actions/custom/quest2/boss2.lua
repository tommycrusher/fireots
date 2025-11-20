local boss2 = Action()
function boss2.onUse(cid, item, fromPosition, item2, toPosition)

local monstername1 = "Fury Of The Emperor"
local monster1 = {x=33096,y=31088,z=15}

actionstatus = getPlayerStorageValue(cid,1060)
if actionstatus >= 1 then
if doCreatureSay(cid, "The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_ORANGE_1) then
else
doPlayerSendTextMessageCancel(cid,MESSAGE_INFO_DESCR,"Sorry is not possible.")
end

function Summon()
doSummonCreature(monstername1,monster1)
end

addEvent(Summon,100)
end
end
boss2:uid(3194)
boss2:register()
