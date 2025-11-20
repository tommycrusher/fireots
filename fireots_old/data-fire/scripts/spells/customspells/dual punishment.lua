local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat1, COMBAT_PARAM_USECHARGES, true)


function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 3
	return -(skillTotal / 2 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat2, COMBAT_PARAM_USECHARGES, true)



function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 3
	return -(skillTotal / 2 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat3, COMBAT_PARAM_USECHARGES, true)



function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 3
	return -(skillTotal / 2 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local area1 = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat1, area1)
local area2 = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat2, area2)
local area3 = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat3, area3)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 1000, parameters)
addEvent(onCastSpell3, 2000, parameters)
return TRUE
end
