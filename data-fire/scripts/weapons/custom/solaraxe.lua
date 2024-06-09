local combat = Combat()
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
combat:setFormula(COMBAT_FORMULA_SKILL, 0.2, 30, 1.2, -180)

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(1, 2000, -73)
condition:addDamage(1, 2000, -72)
condition:addDamage(1, 2000, -54)
condition:addDamage(1, 2000, -31)
condition:addDamage(1, 2000, -27)
condition:addDamage(1, 2000, -23)
condition:addDamage(1, 2000, -11)
condition:addDamage(1, 2000, -11)
condition:addDamage(1, 2000, -1)
condition:addDamage(1, 2000, -1)
condition:addDamage(1, 2000, -1)
combat:addCondition(condition)

local solaraxe = Weapon(WEAPON_AXE)
solaraxe.onUseWeapon = function(player, variant)
	return combat:execute(player, variant)
end
solaraxe:id(8097)
--starwand:shootType(CONST_ANI_HOLY)
solaraxe:register()
