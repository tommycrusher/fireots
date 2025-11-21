local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 38)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.4, -50, -2.2, -100, 2, 2, 1.5, 4)

arr = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

local spell = Spell("instant")

function spell.onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end

spell:group("attack", "focus")
spell:id(185)
spell:name("No Love")
spell:words("exevo no love")
spell:level(150)
spell:mana(1380)
spell:isAggressive(true)
spell:blockWalls(true)
spell:needTarget(true)
spell:isPremium(true)
spell:range(7)
spell:isSelfTarget(true)
spell:cooldown(15 * 1000)
spell:groupCooldown(2 * 500, 20 * 500)
spell:needLearn(false)
spell:vocation("master sorcerer;true", "sorcerer;true")
spell:register()
