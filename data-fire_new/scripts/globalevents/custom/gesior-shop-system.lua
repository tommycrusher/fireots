-- ### CONFIG ###
-- message to player "type", if delivery of item debugs client, it can be because of undefinied type (type that does not exist in your server LUA)
SHOP_MSG_TYPE = MESSAGE_EVENT_ADVANCE
-- ### END OF CONFIG ###

local shop = GlobalEvent("shop")

function shop.onThink(interval)
    local resultId = db.storeQuery("SELECT * FROM z_ots_comunication")
    if resultId ~= false then
        repeat
            local transactionId = result.getDataInt(resultId, "id")
            local player = Player(result.getDataString(resultId, "name"))

            if player then
                local itemId = tonumber(result.getDataString(resultId, "param1"))
                local itemCount = tonumber(result.getDataString(resultId, "param2"))
                local containerId = tonumber(result.getDataString(resultId, "param3"))
                local containerItemsInsideCount = tonumber(result.getDataString(resultId, "param4"))
                local shopOfferType = result.getDataString(resultId, "param5")
                local shopOfferName = result.getDataString(resultId, "param6")

                local item = Game.createItem(itemid, count)
                if item then
                    return item:getUniqueId()
                end


                -- DELIVER ITEM
                if shopOfferType == 'item' then
                    local newItem = Game.createItem(itemId, itemCount)
                    --  item does not exist, wrong id OR count
                    if not newItem then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                        print('ERROR! Website Shop (' .. player:getName() .. ') - cannot create item - invalid item ID OR count - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                        return true
                    end

                    -- get player store inbox as container, so we can add item to it
                    local playerStoreInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
                    -- cannot open Store Inbox, report problem
                    if not playerStoreInbox then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                        print('ERROR! Website Shop (' .. player:getName() .. ') - cannot open player "Store Inbox" - it is not supported in your server OR variable "CONST_SLOT_STORE_INBOX" is not definied in LUA')
                        return true
                    end
                    -- add container with items to Store Inbox
                    receivedItemStatus = playerStoreInbox:addItemEx(newItem)

                    if type(receivedItemStatus) == "number" and receivedItemStatus == RETURNVALUE_NOERROR then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'You received ' .. shopOfferName .. ' from Website Shop. You can find your item in STORE INBOX (under EQ).')
                        db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. transactionId)
                        db.asyncQuery("UPDATE `z_shop_history_item` SET `trans_state`= 'realized', `trans_real`=" .. os.time() .. " WHERE `id` = " .. transactionId)
                    else
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                        print('ERROR! Website Shop (' .. player:getName() .. ') - cannot add item to STORE INBOX - unknown reason, is it\'s size limited and it is full? - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                    end

                    -- DELIVER CONTAINER
                elseif shopOfferType == 'container' then
                    -- create empty container
                    local newContainer = Game.createItem(containerId, 1)
                    -- container item does not exist OR item is not Container
                    if not newContainerUID or not Container(newContainer.uid) then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                        print('ERROR! Website Shop (' .. player:getName() .. ') - cannot create container - invalid container ID - CONTAINER ID:' .. containerId)
                        return true
                    end

                    -- add items to container
                    for i = 1, containerItemsInsideCount do
                        -- create new item
                        local newItem = Game.createItem(itemId, itemCount)
                        --  item does not exist, wrong id OR count
                        if not newItem then
                            player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                            print('ERROR! Website Shop (' .. player:getName() .. ') - cannot create item - invalid item ID OR count - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                            return true
                        end

                        -- add item to container
                        local addItemToContainerResult = newContainer:addItemEx(newItem)
                        -- report error if it's not possible to add item to container
                        if type(addItemToContainerResult) ~= "number" or addItemToContainerResult ~= RETURNVALUE_NOERROR then
                            player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                            print('ERROR! Website Shop (' .. player:getName() .. ') - cannot add item to container - item is not pickable OR variable "RETURNVALUE_NOERROR" is not definied in LUA - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                            return true
                        end
                    end

                    -- get player store inbox as container, so we can add item to it
                    local playerStoreInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
                    -- cannot open Store Inbox, report problem
                    if not playerStoreInbox then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                        print('ERROR! Website Shop (' .. player:getName() .. ') - cannot open player "Store Inbox" - it is not supported in your server OR variable "CONST_SLOT_STORE_INBOX" is not definied in LUA')
                        return true
                    end
                    -- add container with items to Store Inbox
                    receivedItemStatus = playerStoreInbox:addItemEx(newContainer)

                    if type(receivedItemStatus) == "number" and receivedItemStatus == RETURNVALUE_NOERROR then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'You received ' .. shopOfferName .. ' from Website Shop. You can find your item in STORE INBOX (under EQ).')
                        db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. transactionId)
                        db.asyncQuery("UPDATE `z_shop_history_item` SET `trans_state`= 'realized', `trans_real`=" .. os.time() .. " WHERE `id` = " .. transactionId)
                    else
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                        print('ERROR! Website Shop (' .. player:getName() .. ') - cannot add container with items to STORE INBOX - unknown reason, is it\'s size limited and it is full? - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount .. ', CONTAINER ID:' .. containerId .. ', ITEMS IN CONTAINER COUNT:' .. containerItemsInsideCount)
                    end

			elseif(shopOfferType == 'addon') then
				doPlayerSendTextMessage(cid, messageType, "You received >> ".. add_item_name .." << from OTS shop.")
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
				doPlayerAddOutfit(cid, itemId, containerId)
				doPlayerAddOutfit(cid, itemCount, containerItemsInsideCount)
				db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
				db.asyncQuery("UPDATE `z_shop_history` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE comunication_id = " .. id .. ";")
				doPlayerSave(cid)
			elseif(shopOfferType == 'mount') then
				if(not doPlayerAddMount) then
					print("[ERROR - gesior-shop-system] Your server doesn't support mounts. Remove all items in database from your `z_shop_offers` table where `offer_type` = mount and also in `z_ots_comunication` where `param5` = mount.")
				else
					doPlayerAddMount(cid, shopOfferName)
					doPlayerSendTextMessage(cid, messageType, "You received >> ".. add_item_name .." << from OTS shop.")
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)

					db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
					db.asyncQuery("UPDATE `z_shop_history` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE comunication_id = " .. id .. ";")
					doPlayerSave(cid)
				end
			end
            end
        until not result.next(resultId)
        result.free(resultId)
    end

    return true
end

shop:interval(30000) -- how often to randomize rain / weather
shop:register()
