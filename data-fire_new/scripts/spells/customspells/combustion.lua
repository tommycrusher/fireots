local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -5.3, -300, -7.7, 500)

local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 5, 3000, -25)
addDamageCondition(condition, 1, 5000, -666)
Combat.addCondition(condition)

function onGetFormulaValues(cid, level, maglevel)
	min = (level * 0.9 + maglevel * 8.5) * 1.5
	max = (level * 1.5 + maglevel * 12.7) * 2
	if min < 50 then
		min = 50
	end
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
