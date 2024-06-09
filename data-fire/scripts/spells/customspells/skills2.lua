local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 4000)
setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, 70)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 70)
Combat.addCondition(condition)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
