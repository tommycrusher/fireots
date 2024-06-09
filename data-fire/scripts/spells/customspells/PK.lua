-- haste
local combatHaste = createCombatObject()
setCombatParam(combatHaste, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combatHaste, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combatHaste, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)


local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 14000)
setConditionFormula(condition, 0, 350, 0, 350)
setCombatCondition(combatHaste, condition)

-- outfit
local outCombat = createCombatObject()
setCombatParam(outCombat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)

local condition = createConditionObject(CONDITION_OUTFIT)
setConditionParam(condition, CONDITION_PARAM_TICKS, 3 * 24 * 3600 * 1000) -- here time in miliseconds, default 3 days
addOutfitCondition(condition, {lookType=128, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=129, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=130, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=131, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=132, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=133, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=134, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=143, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=144, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=145, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=146, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=151, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=152, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=153, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=154, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=251, lookHead=114, lookBody=114, lookLegs=94, lookFeet=94})
addOutfitCondition(condition, {lookType=128, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=129, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=130, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=131, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=132, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=133, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=134, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=143, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=144, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=145, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=146, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=151, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=152, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=153, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=154, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
addOutfitCondition(condition, {lookType=251, lookHead=39, lookBody=35, lookLegs=45, lookFeet=45})
setCombatCondition(outCombat, condition) 

-- exevo san
local sanCombat = createCombatObject()
setCombatParam(sanCombat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(sanCombat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(sanCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
function onGetDmg1(cid, level, maglevel)
    return 0,0
end

setCombatCallback(sanCombat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetDmg1")
-- SD
local sdCombat = createCombatObject()
setCombatParam(sdCombat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(sdCombat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(sdCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
function onGetDmg2(cid, level, maglevel)
    return 0,0
end

setCombatCallback(sdCombat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetDmg2")

function onCastSpell(cid, var)
    if(isCreature(variantToNumber(var)) == TRUE) then
        if(getCreatureCondition(cid, CONDITION_OUTFIT) == 0) then -- random outfit
            doCombat(0, outCombat, numberToVariant(cid))
        end
        if(getCreatureHealth(cid) < 700 and getCreatureCondition(cid, CONDITION_HASTE) == 0) then
            doCombat(0, combatHaste, numberToVariant(cid))
            doCreatureSay(cid,"utani hur",TALKTYPE_SAY)
            addEvent(doTargetCombatHealth, 300, 0, cid, COMBAT_HEALING, 600, 1100, CONST_ME_MAGIC_BLUE)
            addEvent(doCreatureSay, 300, cid,"exura san",TALKTYPE_SAY)
            addEvent(doTargetCombatHealth, 1300, 0, cid, COMBAT_HEALING, 600, 1100, CONST_ME_MAGIC_BLUE)
            addEvent(doCreatureSay, 1300, cid,"exura san",TALKTYPE_SAY)
        else
            if(math.random(0,99) > 60 and (getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 950)) then -- 40% percent chance to heal when hp lose higher then 750
                doTargetCombatHealth(0, cid, COMBAT_HEALING, 600, 1100, CONST_ME_MAGIC_BLUE)
                doCreatureSay(cid,"exura san",TALKTYPE_SAY)
            elseif(math.random(0,99) > 20 and (getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 1550)) then -- 80% percent chance to heal when hp lose higher then 1500
                doTargetCombatHealth(0, cid, COMBAT_HEALING, 600, 1100, CONST_ME_MAGIC_BLUE)
                doCreatureSay(cid,"exura san",TALKTYPE_SAY)
            elseif(math.random(0,99) > 10 and (getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 2000)) then -- 90% percent chance to heal when hp lose higher then 2000
                doTargetCombatHealth(0, cid, COMBAT_HEALING, 600, 1100, CONST_ME_MAGIC_BLUE)
                doCreatureSay(cid,"exura san",TALKTYPE_SAY)
            elseif(getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 700) then -- 100% to drink great spirit potion if hp lose higher then 100
                doTargetCombatHealth(0, cid, COMBAT_HEALING, 200, 400, CONST_ME_MAGIC_BLUE)
                doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
            else
                local friends = {}
                local hp_loss = 0
                local heal = 0
                local commander = 0
                local position = getCreaturePosition(cid)
                for x = -7, 7 do
                    for y = -5, 5 do
                        if not (x == 0 and y == 0) then
                            pos = {x = position.x+x, y = position.y+y, z = position.z, stackpos = STACKPOS_TOP_CREATURE}
                            creature = getTopCreature(pos)
                            if (isCreature(creature.uid) == TRUE and getCreatureName(creature.uid) == "Player Killer") then
                                table.insert(friends,creature.uid)
                            end
                        end
                    end
                end
                if(math.random(0,99) < 15) then
                    commander = 1
                end
                for i=1, #friends do
                    if(commander == 1) then
                        doChallengeCreature(friends[i], variantToNumber(var))
                    end
                    if(getCreatureMaxHealth(friends[i]) - getCreatureHealth(friends[i]) > hp_loss) then
                        hp_loss = getCreatureMaxHealth(friends[i]) - getCreatureHealth(friends[i])
                        heal = friends[i]
                    end
                end
                if(heal ~= 0 and hp_loss > 450 and math.random(0,99) < 65) then
                    doTargetCombatHealth(cid, heal, COMBAT_HEALING, 500, 900, CONST_ME_MAGIC_BLUE)
                end
            end
        end
        if(math.random(0,99) > 60) then -- 40% to shot sd
            doCombat(cid, sdCombat, var)
            doTargetCombatHealth(cid, variantToNumber(var), COMBAT_DEATHDAMAGE, -250, -500, CONST_ME_NONE)
        elseif(math.random(0,99) > 30) then -- 70% to shot exori san
            doCombat(cid, sanCombat, var)
            doTargetCombatHealth(cid, variantToNumber(var), COMBAT_HOLYDAMAGE, -60, -200, CONST_ME_NONE)
            doCreatureSay(cid,"exori san",TALKTYPE_SAY)
        end
    end
end
