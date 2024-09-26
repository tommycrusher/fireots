local dhqSlayer = Action()
function dhqSlayer.onUse(cid, item, frompos, item2, topos)
         local pos = {x=177, y=1616, z=12, stackpos=1} 
         local stone = 1355
         local stoneFromPos = getThingfromPos(pos)
if item.itemid == 1945 then
    doTransformItem(item.uid,1946)
  elseif item.itemid == 1946 then
    doTransformItem(item.uid,1945)
end

if item.uid == 12000 and item.itemid == 1945 then
         doRemoveItem(stoneFromPos.uid, 1)
         doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You removed a Stone.")
     end
if item.uid == 12000 and item.itemid == 1946 then
         doCreateItem(stone, 1, pos)
         doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You added a Stone.")

     end
  return true
end
dhqSlayer:uid(12000)
dhqSlayer:register()
