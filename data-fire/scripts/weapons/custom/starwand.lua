local combat = Combat()
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 0)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 0)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.5, -1, -1.2, -1.5, 2, 2, 0.5, 1)

local manaNeededPerTarget = 20
local hitExtraTargets = 3
local hitExtraTargetsInRange = 2

function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers)
    local creaturesList = {}
    for x = -radiusx, radiusx do
        for y = -radiusy, radiusy do
            if not (x == 0 and y == 0) then
            	local t = Tile({x = position.x+x, y = position.y+y, z = position.z})
                if not t.hasFlag(TILESTATE_NOPVPZONE) then
                    creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z, stackpos = STACKPOS_TOP_CREATURE})
                    if (creature.type == 1 and showPlayers == 1) or (creature.type == 2 and showMonsters == 1) then
                        table.insert(creaturesList, creature.uid)
                    end
                end
            end
        end
    end
    return creaturesList
end

local starwand = Weapon(WEAPON_WAND)
starwand.onUseWeapon = function(player, variant)
	if player:getSkull() == SKULL_BLACK then
		return false
	end

    local ret = combat:execute(player, variant)
    if(ret == LUA_ERROR) then
        return LUA_ERROR
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
        local otherTargets = getCreaturesInRange(player:getPosition(), hitExtraTargetsInRange, hitExtraTargetsInRange, 1, hitplayers)
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
