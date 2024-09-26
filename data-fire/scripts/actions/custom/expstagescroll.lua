local config = { 
	rate = 2,
	storage = 11000,
	expstorage = 11100,
	register = 11200,
	time = 14400,
} 
local expStagescroll = Action()
function expStagescroll.onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, config.storage) <= 0 then
		--local rates = getPlayerRates(cid)
		local expStage = getRateFromTable(experienceStages, cid:getLevel(), configManager.getNumber(configKeys.RATE_EXP))
		setPlayerStorageValue(cid, config.expstorage, expStage)
		setPlayerStorageValue(cid, config.register, 1)
		itemEx=itemid == 9004
		doCreatureSay(cid, "Your extra experience rate has been activated! It is now: " .. config.rate .. "x added to your former experience rate.", TALKTYPE_ORANGE_1, true, cid)
		setPlayerStorageValue(cid, config.storage, os.time()+config.time) 
		--doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]*config.rate) 
		doRemoveItem(item.uid,1)
		registerCreatureEvent(cid, "ExpStage")
	else
		doCreatureSay(cid, "You must finish first exp condition to start other exp condition !", TALKTYPE_ORANGE_1, true, cid)
	end
return true
end
expStagescroll:id(9004)
expStagescroll:register()
