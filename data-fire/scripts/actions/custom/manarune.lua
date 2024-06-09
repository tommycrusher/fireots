local manarune = Action()
function manarune.onUse(player, item, frompos, item2, topos)

local level = getPlayerLevel(player)
local mlevel = getPlayerMagLevel(player)

-- Exhausted Settings --
local exhausted_seconds = 1 -- How many seconds manarune will be unavailible to use. --
local exhausted_storagevalue = 7000 -- Storage Value to store exhaust. It MUST be unused! --
-- Exhausted Settings END --

-- Mana Formula Settings --
-- You can use "level" and "mlevel" --
local mana_minimum = (level * 0.9) + (mlevel * 3.5) - 30
local mana_maximum = (level * 1.8) + (mlevel * 4) - 100
-- Mana Formula Settings END --

local mana_add = math.random(mana_minimum, mana_maximum)

-- We check the charges. --
if(item.type > 1) then
-- Exhausted check. --
	if(os.time() > getPlayerStorageValue(player, exhausted_storagevalue)) then
-- Entity is player? --
		if(isPlayer(item2.uid) == true) then
			doSendMagicEffect(topos,28)
			doSendMagicEffect(topos, CONST_ME_MAGIC_GREEN)
			player:say("Mana UUPP!!!", TALKTYPE_MONSTER_SAY)
			doPlayerAddMana(item2.uid, mana_add)
			setPlayerStorageValue(player, exhausted_storagevalue, os.time() + exhausted_seconds)
			doChangeTypeItem(item.uid, item.type - 1)
		else
			doSendMagicEffect(frompos, CONST_ME_POFF)
			doPlayerSendCancel(player, "You can use this rune only on players.")
		end
	else
		doSendMagicEffect(frompos, CONST_ME_POFF)
		doPlayerSendCancel(player, "You are exhausted.")
	end
	else
		if(os.time() < getPlayerStorageValue(player, exhausted_storagevalue)) then
			doSendMagicEffect(frompos, CONST_ME_POFF)
			doPlayerSendCancel(player, "You are exhausted.")
		else
			if(isPlayer(item2.uid) == true) then
				doSendMagicEffect(topos,28)
				doSendMagicEffect(topos, CONST_ME_MAGIC_GREEN)
				player:say("Mana UUPP!!!", TALKTYPE_MONSTER_SAY)
				doPlayerAddMana(item2.uid, mana_add)
				setPlayerStorageValue(player, exhausted_storagevalue, os.time() + exhausted_seconds)
				doRemoveItem(item.uid, 1)
			else
				doSendMagicEffect(frompos, CONST_ME_POFF)
				doPlayerSendCancel(player, "You can use this rune only on players.")
			end
		end
	end
	return true
end
manarune:id(3157)
manarune:register()
