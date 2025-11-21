local replica = Action()
function replica.onUse(cid, item, fromPosition, itemEx, toPosition)
        if itemEx.itemid == 6324 or itemEx.itemid == 6325 then
                if getPlayerStorageValue(cid, 1060) >= 1 then
        	doCreatureSay(cid, "NOOOoooooooo...!", TALKTYPE_ORANGE_1)
		doCreatureSay(cid, "This should have dealt the deathblow to the snake things' ambitions.", TALKTYPE_ORANGE_1)
                setPlayerStorageValue(cid, 2060, 1)
            end
        end
end
replica:aid(12318)
replica:register()
