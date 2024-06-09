local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 1)
function onGetFormulaValues(cid, level, maglevel)
	min = -(level * .2 + maglevel * 4.8) * 0.8
	max = -(level * .2 + maglevel * 4.8) * 1.8
	
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local condition = createConditionObject(CONDITION_DROWN)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 2000, -20)
Combat.addCondition(condition)

local area = createCombatArea(AREA_CIRCLE6X6)

setCombatArea(combat, area)



function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
