local orangeTree = Action()
function orangeTree.onUse(cid, item, frompos, item2, topos)
if item.itemid == 4006 then
doTransformItem(item.uid,4008)
doPlayerAddItem(cid,2675,3)
doDecayItem(item.uid)
end
return true 
end
orangeTree:id(4006)
orangeTree:register()
