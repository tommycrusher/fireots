local MAX = 2520

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))
local staminaticket = Action()
function staminaticket.onUse(cid, item, fromPosition, itemEx, toPosition)
	if(not isPlayer(itemEx.uid)) then
		return false
	end

	if(hasCondition(cid, CONDITION_EXHAUST_HEAL)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end

	if getPlayerStamina(cid) == MAX then
		doPlayerSendCancel(cid, "You have maximum stamina!")
		return false
	end
	local STAMINA = getPlayerStamina(cid)
        doPlayerSetStamina(cid, STAMINA+120)
	doAddCondition(cid, exhaust)
	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	doCreatureSay(itemEx.uid, "Juuuupi...", TALKTYPE_ORANGE_1)
	doRemoveItem(item.uid, 1)
	return true
end
staminaticket:id(2297)
staminaticket:register()
