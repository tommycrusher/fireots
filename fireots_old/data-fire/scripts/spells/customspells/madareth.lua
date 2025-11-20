local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 170)
Combat.addCondition(condition)

local area = createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4)
setCombatArea(combat, area)


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
