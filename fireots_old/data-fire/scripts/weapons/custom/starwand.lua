local area = createCombatArea({
	{ 1, 1, 1 },
	{ 1, 3, 1 },
	{ 1, 1, 1 },
})
local combat = Combat()
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.5, -1, -1.1, -1.4, 1.5, 1.5, 0.5, 1)
combat:setArea(area)

local manaNeededPerTarget = 20
local hitExtraTargets = 3
local hitExtraTargetsInRange = 2

function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers)
    local creaturesList = {}
    for x = -radiusx, radiusx do
        for y = -radiusy, radiusy do
            if not (x == 0 and y == 0) then
                if getTileInfo({x = position.x+x, y = position.y+y, z = position.z}).protection ~= TRUE then
                    local creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z, stackpos = STACKPOS_TOP_CREATURE})
                    if (creature.type == 1 and showPlayers == 1) or (creature.type == 2 and showMonsters == 1) then
                        table.insert(creaturesList, creature.uid)
                    end
                end
            end
        end
    end
    return creaturesList
end
local function isCreaturesInRange(radiusx, radiusy, showMonsters, showPlayers)
    local creaturesList = {}
	for positionX = radiusx.x, radiusy.x do
		for positionY = radiusx.y, radiusy do
			for positionZ = radiusx.z, radiusy.z do
				local tile = Tile(Position({ x = positionX, y = positionY, z = positionZ }))
				if tile and not getTileInfo(Position({ x = positionX, y = positionY, z = positionZ })).protection then
					if tile:getTopCreature() and tile:getTopCreature():isPlayer() then
					creature = tile:getTopCreature()
					    if (creature.type == 1 and showPlayers == 1) or (creature.type == 2 and showMonsters == 1) then
						table.insert(creaturesList, creature.uid)
					    end
					end
				end
			end
		end
	end
	return creaturesList
end
--	function getCreaturesInRange(self, showMonsters, showPlayers)
--	    local creaturesList = {}
--	    local position, random = self:getPosition(), math.random
--	    position.x = position.x + random(-5, 5)
--	    position.y = position.y + random(-5, 5)
--	    local tile = Tile(position)
--	    local creature = tile:getTopCreature()
--	    if tile and (creature.type == 1 and showPlayers == 1) or (creature.type == 2 and showMonsters == 1) then
--		if random(2) == 1 then
--		    if topCreature then
--		        table.insert(creaturesList, creature.uid)
--		    end
--		end
--	    end
--	    return creaturesList
--	end
	
local starwand = Weapon(WEAPON_WAND)
starwand.onUseWeapon = function(player, variant)
	if player:getSkull() == SKULL_BLACK then
		return false
	end
	local ret = combat:execute(player, variant)
	if(ret == LUA_ERROR) then
		return LUA_ERROR
	end
	if getPlayerMana(player) < manaNeededPerTarget then
		return false
	end
    doPlayerAddMana(player, -manaNeededPerTarget)
    local target = variantToNumber(variant)
    local hitplayers = 0
    if(target ~= 0) then
        if(isPlayer(target) == TRUE) then
            hitplayers = 1
        end
        local nowHit = 0
        local randomId = 0
        local position = getCreaturePosition(player)
        local otherTargets = getCreaturesInRange(position, hitExtraTargetsInRange, hitExtraTargetsInRange, 1, hitplayers)
        if(#otherTargets > 0) then
            for i = 1, hitExtraTargets do
                if(getPlayerMana(player) > manaNeededPerTarget) then
                    randomId = math.random(1, #otherTargets)
                    nowHit = otherTargets[randomId]
                    if(isCreature(nowHit) == TRUE) then
                        table.remove(otherTargets, randomId)
                        ret = doCombat(player, combat, numberToVariant(nowHit))
                        if(ret ~= LUA_ERROR) then
                            doPlayerAddMana(player, -manaNeededPerTarget)
                        end
                    end
                    if(#otherTargets == 0) then
                        break
                    end
                else
                    break
                end
            end
        end
    end
	return combat:execute(player, variant)
end
starwand:id(651)
starwand:shootType(CONST_ANI_HOLY)
starwand:register()
