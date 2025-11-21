local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 35)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.5, -20, -2.3, -50, 2, 2, 4, 2.5)

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

	return doCombat(cid, combat, var)--, exhaustion.set(cid, castleStorage, 300), exhaustion.set(cid, ctfStorage, 20), exhaustion.set(cid, dtbStorage, 20), exhaustion.set(cid, rushStorage, 20)
end
