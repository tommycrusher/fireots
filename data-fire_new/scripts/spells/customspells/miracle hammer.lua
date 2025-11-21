local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WHIRLWINDCLUB)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, 0, -1, 0, 5, 5, 4.81, 8.15)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
