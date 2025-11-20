local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 31)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.2, -50, -1.7, -150, 1, 2.5, 4, 5)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.2, -50, -1.7, -150, 1, 2.5, 4, 5)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 38)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.2, -50, -1.7, -150, 1, 2.5, 4, 5)

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
    doCombat(parameters.cid, parameters.combat1, parameters.var)
end
local function onCastSpell2(parameters)
    doCombat(parameters.cid, parameters.combat2, parameters.var)
end
local function onCastSpell3(parameters)
    doCombat(parameters.cid, parameters.combat3, parameters.var)
end

--local castleStorage, ctfStorage, dtbStorage, rushStorage = '11102', '11202', '11302', '11402'

function onCastSpell(cid, var)
	--domodlib('castle_config')
	--domodlib('DTB_config')
	--domodlib('CTF_config')
	--domodlib('config_rush_event')
	--domodlib('competition_config')
	
	--if getCreatureStorage(cid, castleCfg.storage.playersEvent) == 1 then
	--	if exhaustion.check(cid, castleStorage) ~= false then
	--		return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You are exhausted.'), doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	--	end
	--if (getCreatureStorage(cid, dtbConfig.blue.storage) == 1) or (getCreatureStorage(cid, dtbConfig.red.storage) == 1) then
	--	if exhaustion.check(cid, ctfStorage) ~= false then
	--		return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You are exhausted.'), doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	--	end
	--elseif (getCreatureStorage(cid, ctfConfig.blue.storage) == 1) or (getCreatureStorage(cid, ctfConfig.red.storage) == 1) then
	--	if exhaustion.check(cid, dtbStorage) ~= false then
	--		return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You are exhausted.'), doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	--	end
	--elseif tostring(getCreatureStorage(cid, compConfig.fighter)) == 'true' then
		--return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You can\'t use this spell on Guild Competition War.'), doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	--elseif tostring(getCreatureStorage(cid, configRushEvent.storages.player)) ~= '' then
	--	if exhaustion.check(cid, rushStorage) ~= false then
	--		return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You are exhausted.'), doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
	--	end
	--end
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3 }
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 100, parameters)
addEvent(onCastSpell3, 200, parameters)

	return true--, exhaustion.set(cid, castleStorage, 300), exhaustion.set(cid, ctfStorage, 20), exhaustion.set(cid, dtbStorage, 20), exhaustion.set(cid, rushStorage, 20)
end
