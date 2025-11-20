local flamebeastBro = Action()
function flamebeastBro.onUse(cid, item, frompos, item2, topos)
         local pos1 = {x=2731, y=2875, z=12, stackpos=255} 
         local pos2 = {x=2731, y=2876, z=12, stackpos=255} 

         local floor = 405
         local floorFromPos1 = getThingfromPos(pos1)
         local floorFromPos2 = getThingfromPos(pos2)
if item.itemid == 1945 then
    doTransformItem(item.uid,1946)
  elseif item.itemid == 1946 then
    doTransformItem(item.uid,1945)
end

if item.uid == 12121 and item.itemid == 1945 then
         doCreateItem(floor, pos1)
         doCreateItem(floor, pos2)
         doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You added a Bridge.")
     end
if item.uid == 12121 and item.itemid == 1946 then
         doRemoveItem(floorFromPos1.uid, 1)
         doRemoveItem(floorFromPos2.uid, 1)
         doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You removed a Bridge.")

     end
  return true
end
flamebeastBro:uid(12121)
flamebeastBro:register()
