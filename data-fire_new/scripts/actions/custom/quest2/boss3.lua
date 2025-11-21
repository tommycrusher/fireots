local boss3 = Action()
function boss3.onUse(cid, item, fromPosition, item2, toPosition)

local monstername1 = "Scorn Of The Emperor"
local monster1 = {x=33049,y=31112,z=15}

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
boss3:uid(3196)
boss3:register()
