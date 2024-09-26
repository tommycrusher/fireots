local ownBP = Action()
function ownBP.onUse(cid, item, fromPosition, itemEx, toPosition)
 local playerID = getPlayerGUID(cid)
 local owner = item.actionid-100
  
  if(owner > 0)then
   if(owner ~= playerID)then
    doPlayerSendCancel(cid, 'You aren\'t owner of this container.')
    return TRUE
   end
  end
  
end
ownBP:aid(owner)
ownBP:register()
