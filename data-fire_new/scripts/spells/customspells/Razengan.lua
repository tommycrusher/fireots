local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 47)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, -0.5, -150, 1.7, -300)

local combatDist = createCombatObject()
setCombatParam(combatDist, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatDist, COMBAT_PARAM_EFFECT, 47)
setCombatParam(combatDist, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combatDist, COMBAT_FORMULA_SKILL, -1.2, -100, 1.7, -200)



function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
if(target ~= 0) then
return doCombat(cid, combatDist, numberToVariant(target))
end
return doCombat(cid, combat, var)
end

