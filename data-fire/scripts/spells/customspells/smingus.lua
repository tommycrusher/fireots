local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_EFFECT, 53)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)


function onGetFormulaValues(cid, level, maglevel)
	min = (level * 1 + maglevel * 4) * 2.08
	max = (level * 1 + maglevel * 4) * 2.7
	if min < 250 then
		min = 250
	end
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
