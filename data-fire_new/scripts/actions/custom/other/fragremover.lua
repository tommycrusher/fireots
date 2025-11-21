local frag = Action()
function frag.onUse(cid, item, frompos, item2, topos)
		local noRemove = {SKULL_YELLOW}
		local playerSkull = getPlayerSkullType(cid)
		if isInArray(noRemove, playerSkull) then
			doPlayerSendCancel(cid, "You can't remove this type of skull.")
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			return true
		else
			db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ") AND `killers`.`final_hit` = 1 AND `killers`.`unjustified` = 1 LIMIT 1")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Your last frag & your skull have been removed!")
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_RED)
			doSendAnimatedText(getPlayerPosition(cid), "POFF!", 180)
			doCreatureSetSkullType(cid, 0)
			doPlayerSetSkullEnd(cid, 0, playerSkull)
			doRemoveItem(item.uid, 1)
		end
		return true
end 
frag:id(2306)
frag:register()
