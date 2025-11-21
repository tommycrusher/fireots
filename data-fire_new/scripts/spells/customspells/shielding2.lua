local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_PURPLEENERGY)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, 70)
Combat.addCondition(condition)

local area = createCombatArea(AREA_BEAM7, AREADIAGONAL_BEAM7)
setCombatArea(combat, area)


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
