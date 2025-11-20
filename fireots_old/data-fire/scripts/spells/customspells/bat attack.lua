local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, 1)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 66)

function onGetFormulaValues(cid, level, maglevel)
	min = -maglevel*2  -level*2
	max = -maglevel*4.5 -level*4.5
	
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
arr = {
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

local spell = Spell("instant")
function spell.onCastSpell(creature, variant, isHotkey)
	return combat:execute(cid, var)
end 

spell:group("attack", "focus")
spell:id(155)
spell:name("Bat Attack")
spell:words("exevo gran mas bat")
spell:level(150)
spell:mana(1080)
spell:isAggressive(true)
spell:blockWalls(true)
spell:needTarget(true)
spell:isPremium(true)
spell:range(7)
spell:isSelfTarget(true)
spell:cooldown(20 * 1000)
spell:groupCooldown(2 * 500, 20 * 500)
spell:needLearn(false)
spell:vocation("master sorcerer;true", "sorcerer;true")
spell:register()
