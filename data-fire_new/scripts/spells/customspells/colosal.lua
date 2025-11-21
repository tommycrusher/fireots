local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1, -50, -1.5, -280, 1, 1, 3, 4)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1, -50, -1.5, -280, 1, 1, 3, 4)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_GIANTICE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1, -50, -1.5, -280, 1, 1, 3, 4)
arr1 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}
arr2 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}
arr3 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

local function onCastSpell1(parameters)
    combat:execute(parameters.cid, parameters.combat1, parameters.var)
end
local function onCastSpell2(parameters)
    combat:execute(parameters.cid, parameters.combat2, parameters.var)
end
local function onCastSpell3(parameters)
    combat:execute(parameters.cid, parameters.combat3, parameters.var)
end

local spell = Spell("instant")
function spell.onCastSpell(creature, variant, isHotkey)
	local parameters = { cid = creature, var = variant, combat1 = combat1, combat2 = combat2, combat3 = combat3 }
	addEvent(onCastSpell1, 0, parameters)
	addEvent(onCastSpell2, 100, parameters)
	addEvent(onCastSpell3, 200, parameters)

	return combat:execute(cid, var)
end

spell:group("attack", "focus")
spell:id(155)
spell:name("Earth Power")
spell:words("earth storm")
spell:level(200)
spell:mana(1080)
spell:isAggressive(true)
spell:blockWalls(true)
spell:needTarget(true)
spell:isPremium(true)
spell:range(7)
spell:isSelfTarget(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(4 * 500, 40 * 500)
spell:needLearn(false)
spell:vocation("elder druid;true")
spell:register()
