local expScroll = Action()
function expScroll.onUse(cid, item, fromPosition, itemEx, toPosition)
if(not checkExhausted(cid, 103, 600)) then
	return true
end
if getPlayerLevel(cid) < 500 then
 doCreatureSay(cid, "You Gained 5 000 000 Experience Points!", TALKTYPE_ORANGE_1)
 doPlayerAddExp(cid, 5000000)
 doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
 doRemoveItem(item.uid)
 return TRUE
 else
 doCreatureSay(cid, "You must be lower level then 500 to use this scroll", TALKTYPE_ORANGE_1)
 end
 end
expScroll:id(7720)
expScroll:register()
