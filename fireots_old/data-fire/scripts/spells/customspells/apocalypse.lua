local combat = Combat()

local arr = {
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
combat:setArea(createCombatArea(arr))
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 3.5) + (maglevel * 8)
	local max = (level / 2.5) + (maglevel * 15)
	return -min, -max
end

function spellCallback(param)
	if param.count > 0 or math.random(0, 1) == 1 then
		doSendMagicEffect(param.pos, CONST_ME_HITBYFIRE)
		doAreaCombatHealth(param.player, COMBAT_FIREDAMAGE, param.pos, 0, -100, -300, CONST_ME_EXPLOSIONHIT)
	end

	if(param.count < 5) then
		param.count = param.count + 1
		addEvent(spellCallback, math.random(1000, 4000), param)
	end
end

function onTargetTile(cid, pos)
	local param = {}
	param.cid = cid
	param.pos = pos
	param.count = 0
	spellCallback(param)
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local spell = Spell("instant")
function spell.onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

spell:group("attack", "focus")
spell:id(150)
spell:name("Apocalypse")
spell:words("exevo mas lux")
spell:level(140)
spell:mana(795)
spell:isAggressive(true)
spell:blockWalls(true)
spell:needTarget(true)
spell:isPremium(true)
spell:range(7)
spell:isSelfTarget(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(4 * 500, 40 * 500)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true", "sorcerer;true", "master sorcerer;true")
spell:register()
