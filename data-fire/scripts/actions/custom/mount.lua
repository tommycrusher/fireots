local mount = Action()
function mount.onUse(cid, item, fromPosition, itemEx, toPosition)
if item.itemid == 10063 then

doPlayerSendTextMessage(cid,MESSAGE_STATUS_SMALL,"Congratulations now you can mount basis eight mounts!")
item_uid = doPlayerAddMount(cid, 1)
setPlayerStorageValue(cid,368,1)
item_uid = doPlayerAddMount(cid, 2)
setPlayerStorageValue(cid,369,1)
item_uid = doPlayerAddMount(cid, 3)
setPlayerStorageValue(cid,370,1)
item_uid = doPlayerAddMount(cid, 4)
setPlayerStorageValue(cid,371,1)
item_uid = doPlayerAddMount(cid, 5)
setPlayerStorageValue(cid,372,1)
item_uid = doPlayerAddMount(cid, 6)
setPlayerStorageValue(cid,373,1)
item_uid = doPlayerAddMount(cid, 7)
setPlayerStorageValue(cid,374,1)
item_uid = doPlayerAddMount(cid, 8)
setPlayerStorageValue(cid,375,1)

doRemoveItem(item.uid, 1)
else
return false
end
return true
end
mount:id(10063)
mount:register()
