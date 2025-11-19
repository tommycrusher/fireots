-- Enhanced Magic Shield (Utamo Vita) - Balanced 8.6-inspired formula
-- Improved scaling with better progression and WOD integration
-- Provides strong protection while maintaining classic feel

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local condition = Condition(CONDITION_MANASHIELD)

	-- Enhanced formula: better scaling for high-level content
	-- Base shield stronger than classic but weaker than full WOD
	local level = player:getLevel()
	local magicLevel = player:getMagicLevel()

	-- Improved formula: 250 base + 4*level + 5*maglevel (stronger than pure classic)
	local shield = 250 + (4 * level) + (5 * magicLevel)

	-- Optional WOD bonus (only if player has WOD progression)
	local grade = player:upgradeSpellsWOD("Magic Shield")
	if grade >= WHEEL_GRADE_REGULAR then
		shield = shield * 1.15  -- 15% bonus instead of 25% (more balanced)
	end

	-- Duration: 3 minutes (180 seconds)
	condition:setParameter(CONDITION_PARAM_TICKS, 180000)

	-- Set shield amount (capped at player's max mana)
	condition:setParameter(CONDITION_PARAM_MANASHIELD, math.min(player:getMaxMana(), shield))

	creature:addCondition(condition)
	return combat:execute(creature, var)
end

spell:name("Magic Shield")
spell:words("utamo vita")
spell:group("support")
spell:vocation("druid;true", "elder druid;true", "sorcerer;true", "master sorcerer;true", "ent;true", "wizzard;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_MAGIC_SHIELD)
spell:id(44)
spell:cooldown(14 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(14)
spell:mana(50)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()

