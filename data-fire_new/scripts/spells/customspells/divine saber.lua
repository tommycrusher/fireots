local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 8.78, 13.16)

local area = createCombatArea(AREA_CIRCLE6X6)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
