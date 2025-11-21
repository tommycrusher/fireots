--- Create by Collo~ gg: 7284838 (c)----

local function doPlayerAddPremiumPoints(cid, points)
    return db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
if(not checkExhausted(cid, 103, 5)) then
	return true
end
    doPlayerAddPremiumPoints(cid, 3)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received 3 global point!")
    doSendMagicEffect(toPosition, 13)
    doRemoveItem(item.uid,1)
    return true
end 
