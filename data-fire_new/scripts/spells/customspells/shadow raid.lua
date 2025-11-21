local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat1, COMBAT_PARAM_USECHARGES, true)


function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 5
	return -(skillTotal / 3 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat2, COMBAT_PARAM_USECHARGES, true)



function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 5
	return -(skillTotal / 3 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat3, COMBAT_PARAM_USECHARGES, true)



function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 5
	return -(skillTotal / 3 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat4, COMBAT_PARAM_USECHARGES, true)



function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 5
	return -(skillTotal / 3 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat4, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat5, COMBAT_PARAM_USECHARGES, true)



function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 5
	return -(skillTotal / 3 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat5, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local area1 = createCombatArea(AREA_SQUARE1X1)
local area2 = createCombatArea(AREA_SQUARE1X1)
local area3 = createCombatArea(AREA_SQUARE1X1)
local area4 = createCombatArea(AREA_BEAM1)
local area5 = createCombatArea(AREA_BEAM1)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)


local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
doCombat(parameters.cid, combat5, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell3, 1000, parameters)
addEvent(onCastSpell4, 1500, parameters)
addEvent(onCastSpell5, 2000, parameters)
return TRUE
end
