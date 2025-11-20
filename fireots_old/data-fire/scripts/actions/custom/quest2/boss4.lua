local boss4 = Action()
function boss4.onUse(cid, item, fromPosition, item2, toPosition)

local monstername1 = "Spite Of The Emperor"
local monster1 = {x=33096,y=31110,z=15}

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
boss4:uid(3195)
boss4:register()
