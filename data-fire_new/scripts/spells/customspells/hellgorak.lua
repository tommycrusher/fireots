local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 40)
Combat.addCondition(condition)

local area = createCombatArea(AREA_CIRCLE6X6)
setCombatArea(combat, area)


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
