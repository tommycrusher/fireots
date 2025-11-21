local CHANCES = 50 
local WATERINGCAN_ID = 7734
local WATERED = {7673, 7670, 7680, 7682, 7684, 7686, 7688, 7690, 7992, 7994} 
local PLANTSPECIES = {7680, 7682, 7684, 7682} 
local PLANTADVANCES = {[7679] = {7670, 7673}, [7681] = {7689, 7680}, [7683] = {7691, 7682}, [7685] = {7693, 7684}, [7687] = {7695, 7686}} 
local LASTSTADIUM = {7689, 7691, 7693, 7695} 
local WHITEREDPLANTS = {[7674] = 7689, [7675] = 7691, [7676] = 7693, [7677] = 7695} 
local flowerPot = Action()
function flowerPot.onUse(cid, item, fromPosition, itemEx, toPosition)
local RANDOM = math.random(100)
    if WHITEREDPLANTS[itemEx.itemid] ~= nil then
        doCreatureSay(cid,"You finally remembered to water your plant and it recovered.",TALKTYPE_ORANGE_1)
        doTransformItem(itemEx.uid,WHITEREDPLANTS[itemEx.itemid])
    elseif itemEx.itemid == 7655 then
        doCreatureSay(cid,"You should plant some seeds first.",TALKTYPE_ORANGE_1)
    elseif itemEx.itemid == 7665 then
        doCreatureSay(cid,"You watered your plant.",TALKTYPE_ORANGE_1)
        doTransformItem(itemEx.uid,itemEx.itemid+8)
    elseif isInArray(WATERED,itemEx.itemid) == TRUE then
        doCreatureSay(cid,"Your plant doesn't need water.",TALKTYPE_ORANGE_1)
    elseif PLANTADVANCES[itemEx.itemid] ~= nil then
        if RANDOM <= CHANCES then
            doTransformItem(itemEx.uid,PLANTADVANCES[itemEx.itemid][1])
            doCreatureSay(cid,"Your plant has grown to the next stage!",TALKTYPE_ORANGE_1)
        else
            doTransformItem(itemEx.uid,PLANTADVANCES[itemEx.itemid][2])
            doCreatureSay(cid,"You watered your plant.",TALKTYPE_ORANGE_1)
        end
    elseif itemEx.itemid == 7678 then
        if RANDOM <= CHANCES then
            doCreatureSay(cid,"Your plant has grown to the next stage!",TALKTYPE_ORANGE_1)
            doTransformItem(itemEx.uid,PLANTSPECIES[math.random(4)])
        else
            doCreatureSay(cid,"You watered your plant.",TALKTYPE_ORANGE_1)
            doTransformItem(itemEx.uid,itemEx.itemid-8)
        end
    elseif isInArray(LASTSTADIUM, itemEx.itemid) == TRUE then
        doCreatureSay(cid,"You watered your plant.",TALKTYPE_ORANGE_1)
        doTransformItem(itemEx.uid,itemEx.itemid-1)
    else
        return FALSE
    end
    doDecayItem(itemEx.uid)
    return TRUE
end
flowerPot:id(7734)
flowerPot:register()
