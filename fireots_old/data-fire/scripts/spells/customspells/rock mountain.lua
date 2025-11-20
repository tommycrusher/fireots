local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STONES)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 1.98) + (maglevel * 3.3)
	return -min, -max
end

combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")
function spell.onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

spell:group("attack", "focus")
spell:id(151)
spell:name("Rock Mountain")
spell:words("exori stone")
spell:level(80)
spell:mana(540)
spell:isAggressive(true)
spell:blockWalls(true)
spell:needTarget(true)
spell:isPremium(true)
spell:range(7)
spell:isSelfTarget(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(4 * 500, 40 * 500)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
