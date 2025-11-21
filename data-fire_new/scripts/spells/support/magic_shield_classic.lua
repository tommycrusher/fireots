-- Classic Magic Shield (Utamo Vita) - 8.6-10.0 style
-- Simple formula without Wheel of Destiny scaling
-- Provides nostalgic gameplay experience

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
	
	-- Classic 8.6 formula: simpler calculation
	-- Shield absorbs damage using mana at 1:1 ratio
	local level = player:getLevel()
	local magicLevel = player:getMagicLevel()
	
	-- Classic formula: 200 base + 2*level + 3*maglevel
	local shield = 200 + (2 * level) + (3 * magicLevel)
	
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
