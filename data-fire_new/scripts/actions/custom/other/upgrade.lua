--- Perfect refine system by Mock the bear (MTB).
--- Email: [email]mock_otnet@hotmail.com[/email]
-- &a = weapon attack
-- &d = weapon defense
-- &s = shield defense
-- &p = armor defense
-- # = nivel do item
-- @ = max level
local gain = {
gainArmor='&p+(1)',loseArmor='&p-(1)',
gainShield='&s+#',loseShield='&s-(#+1)',
gainAttack='&a+(1*(#))',loseAttack='&a-(1*(#+1))',
gainDefense='&d+(1*(#))',loseDefense='&d-(1*(#+1))',
chance='(50/math.sqrt((((@/4)+(#*2))/@)*#))',
maxlvl = 10,
blocked_ids = {8881}
}
local it = {
--[itemid] = [percent]
[2272] = 0, -- 0% additional
[2280] = 100, -- 50%
}
if not setItemName then
    function setItemName(uid,name)
		return doItemSetAttribute(uid,'name',name)
    end
    function setItemArmor(uid,name)
		return doItemSetAttribute(uid,'armor',name)
    end
	function setItemDefense(uid,name)
		return doItemSetAttribute(uid,'defense',name)
	end
	function setItemAttack(uid,name)
		return doItemSetAttribute(uid,'attack',name)
	end
	function getItemAttack(uid)
		return getItemAttribute(uid,'attack')
	end
	function getItemDefense(uid)
		return getItemAttribute(uid,'defense')
	end
function getItemArmor(uid)
   if type(uid) == 'number' then
      return getItemAttribute(uid,'armor')
   else
      return getItemInfo(uid.itemid).armor
   end
end
end
 
local function isArmor(uid) -- Function by Mock the bear.
    if (getItemInfo(uid.itemid).armor ~= 0) and (getItemWeaponType(uid.uid) == 0) then
		return true
	end
	return false
end
local function isWeapon(uid) -- Function by Mock the bear.
	uid = uid or 0
	local f = getItemWeaponType(uid)
	if f == 1 or f == 2 or f == 3 then
		return true
	end
	return false
end
local function isShield(uid) -- Function by Mock the bear.
	uid = uid or 0
	if getItemWeaponType(uid) == 5 then
		return true
	end
	return false
end
local function isBow(uid) -- Function by Mock the bear.
	uid = uid or 0
	if getItemWeaponType(uid) == 4 then
		return true
	end
	return false
end
local function getWeaponLevel(uid) -- Function by Mock the bear.
   uid = uid or 0
   local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
   local lvl = string.match(name,'%s%+(%d+)%s*')
   return tonumber(lvl) or 0
end
local function doTransform(s,i) -- Function by Mock the bear.
    local c = string.gsub(s,'@',gain.maxlvl)
    local c = string.gsub(c,'&a',(getItemAttack(i.uid) ~= 0 and getItemAttack(i.uid) or getItemInfo(i.itemid).attack))
    local c = string.gsub(c,'&d',(getItemDefense(i.uid) ~= 0 and getItemDefense(i.uid) or getItemInfo(i.itemid).defense))
    local c = string.gsub(c,'&s',(getItemDefense(i.uid) ~= 0 and getItemDefense(i.uid) or getItemInfo(i.itemid).defense))
    local c = string.gsub(c,'&p',(getItemArmor(i.uid) ~= 0 and getItemArmor(i.uid) or getItemInfo(i.itemid).armor))
    local c = string.gsub(c,'#',getWeaponLevel(i))
    local q = assert(loadstring('return '..c))
    return math.floor(assert(q()))
end
local upgrade = Action()
function upgrade.onUse(cid, item, fromPosition, itemType, toPosition)
         if item.uid == 0 or item.itemid == 0 then return false end
		 toPosition.stackpos = 255
         if isInArray(gain.blocked_ids, itemType:getId())
          or (not itemType:getWeaponType() or itemType:getWeaponType() > 5)
           or (itemType:getWeaponType() == 0 and not itemType:getArmor())
             or itemType:getId() == 0 or itemType:getType() > 1 or isItemStackable(itemType(id)) then
                doPlayerSendTextMessage(cid, 20,"You cant refine this item.")
                return TRUE
         end
         if isCreature(itemType) == TRUE then
            return FALSE
         end
        local level = getWeaponLevel(itemType(id))
        local chance = doTransform(gain.chance,itemType(id))
		if level == gain.maxlvl then
			doSendMagicEffect(toPosition, 2)
            return doPlayerSendTextMessage(cid, 20,"Your item is on max level, you can't upgrade it.")
		end
		doPlayerSendTextMessage(cid, 20,"Trying refine with "..(chance+it[item.itemid] > 100 and 100 or chance+it[item.itemid]).."% of sucess!")
        if chance+it[item.itemid] >= math.random(0,100) then
			local nm = getItemName(itemType(id))
			local slot = nm:match('(%[.+%])') or '' ---If you server use slot system dont change it ^^
			slot = slot~='' and ' '..slot or slot
            setItemName(itemType(id), getItemNameById(itemType:getId())..' +'..(level+1)..slot)
            addEvent(doPlayerSendTextMessage,500,cid, 20,"Your item has been upgrated to +"..(level+1)..slot..".")
            doSendMagicEffect(toPosition, 12)
            if isArmor(itemType) then
				local get = doTransform(gain.gainArmor,itemType(id))
				setItemArmor(itemType(id),get)
			elseif isBow(itemEx.uid) then
				setItemAttack(itemType(id), doTransform(gain.gainAttack,itemType(id)))
			elseif isWeapon(itemEx.uid) then
				setItemAttack(itemType(id), doTransform(gain.gainAttack,itemType(id)))
				setItemDefense(itemType(id), doTransform(gain.gainDefense,itemType(id)))
            elseif isShield(itemType(id)) then
				setItemDefense(itemType(id), doTransform(gain.gainShield,itemType(id)))
			end
        else
			if level == 0 then
				addEvent(doPlayerSendTextMessage,500,cid, 20,"No effect.")
				doSendMagicEffect(toPosition, 2)
			elseif level > 0 then
			local nm = getItemName(itemType(id))
			local slot = nm:match('(%[.+%])') or '' ---If you server use slot system dont change it ^^
				slot = slot~='' and ' '..slot or slot
				if level == 1 then
					setItemName(itemType(id), getItemNameById(itemType:getId())..slot)
					addEvent(doPlayerSendTextMessage,500,cid, 20,"Your item back to normal.")
				else
					setItemName(itemType(id), getItemNameById(itemEx.itemid)..' +'..(level-1)..slot)
					addEvent(doPlayerSendTextMessage,500,cid, 20,"Your item back to +"..(level-1)..slot..".")
				end
				if isArmor(itemEx) then
					setItemArmor(itemType(id),doTransform(gain.loseArmor  ,itemType(id)))
				elseif isWeapon(itemType(id)) then
					setItemAttack(itemType(id), doTransform(gain.loseAttack,itemType(id)))
					setItemDefense(itemType(id), doTransform(gain.loseDefense,itemType(id)))
				elseif isBow(itemEx.uid) then
					setItemAttack(itemType(id), doTransform(gain.loseAttack,itemType(id)))
				elseif isShield(itemEx.uid) then
					setItemDefense(itemType(id), doTransform(gain.loseShield,itemType(id)))
				end
			end
			doSendMagicEffect(toPosition, 9)
        end
	doRemoveItem(item.uid,1)
	return true
end
upgrade:id(2272,2280)
upgrade:register()
