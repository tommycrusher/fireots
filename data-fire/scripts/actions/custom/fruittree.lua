local fruitTree = Action()
function fruitTree.onUse(cid, item, frompos, item2, topos)

	if item.itemid == 2785 then		-- blueberry bush
		doTransformItem(item.uid, 2786)
		doDecayItem(item.uid)
		doCreateItem(2677, 3, topos)
	end

	return true
end
fruitTree:id(2785)
fruitTree:register()
