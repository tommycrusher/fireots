    function onUse(cid, item, fromPosition, itemEx, toPosition)


    local sorcerer = 900 -- Mana Whit Sorcerer

    local druid = 900 -- Mana Whit Druid

    local paladin = 600 -- Mana Whit Paladin

    local knight = 400 --Mana Whit  Knight

    local master = 1300 -- Mana Whit Master Sorcerer

    local elder = 1300 -- Mana Whit Elder Druid

    local royal = 900 -- Mana Whit Royal Paladin

    local elite = 600 -- Mana Whit Elite Knight


    local playerVoc = getPlayerVocation(cid)

    if playerVoc == 1 then
    doPlayerAddMana(cid, sorcerer)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)

    elseif playerVoc == 2 then
    doPlayerAddMana(cid, druid)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_GREEN)

    elseif playerVoc == 3 then
    doPlayerAddMana(cid, paladin)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_YELLOW)

    elseif playerVoc == 4 then
    doPlayerAddMana(cid, knight)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_STUN)

    elseif playerVoc == 5 then
    doPlayerAddMana(cid, master)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)

    elseif playerVoc == 6 then
    doPlayerAddMana(cid, elder)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_GREEN)

    elseif playerVoc == 7 then
    doPlayerAddMana(cid, royal)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_YELLOW)

    elseif playerVoc == 8 then
    doPlayerAddMana(cid, elite)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_STUN)

     
    end
    return true
    end