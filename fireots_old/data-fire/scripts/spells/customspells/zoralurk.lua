local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BATS)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
Combat.addCondition(CONDITION_PARAM_TICKS, 20000)
Combat.addCondition(CONDITION_PARAM_SKILL_MELEEPERCENT, 30)
Combat.addCondition(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 30)
Combat.addCondition(CONDITION_PARAM_SKILL_SHIELDPERCENT, 1)
Combat.addCondition(CONDITION_PARAM_STAT_MAGICLEVELPERCENT, 70)
Combat.addCondition(condition)

combat:setArea(createCombatArea(AREA_CIRCLE3X3))


local spell = Spell("instant")
function spell.onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
