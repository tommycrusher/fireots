function count4()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
    doSendAnimatedText(bombPos, "4 minuts", TEXTCOLOR_YELLOW)
    addEvent(count3, 60*1000)
end

function count3()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
doSendAnimatedText(bombPos, "3 minuts", TEXTCOLOR_YELLOW)
    addEvent(count2, 60*1000)
end

function count2()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
doSendAnimatedText(bombPos, "2 minuts", TEXTCOLOR_YELLOW)
    addEvent(count1, 60*1000)
end

function count1()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
doSendAnimatedText(bombPos, "1 minuts", TEXTCOLOR_YELLOW)
    addEvent(sec5, 30*1000)
end

function sec5()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
doSendAnimatedText(bombPos, "30 seconds", TEXTCOLOR_YELLOW)
    addEvent(sec4, 20*1000)
end
   
function sec4()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
doSendAnimatedText(bombPos, "10 seconds", TEXTCOLOR_YELLOW)
    addEvent(sec3, 5*1000)
end

function sec3()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
doSendAnimatedText(bombPos, "5 seconds", TEXTCOLOR_YELLOW)
    addEvent(sec2, 3*1000)
end

function sec2()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
doSendAnimatedText(bombPos, "BAAANGG!", TEXTCOLOR_YELLOW)
    addEvent(explode, 2*1000)
end

function explode()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
local bombRemove = getThingFromPos(bombPos)
    doTransformItem(bombRemove.uid, 9889, 1)
for x = 196, 2209 do -- X Position of the explosion area
for y = 88, 2093 do -- Y Position of explosion area
local areaPos = {x=x, y=y, z=7, stackpos=253}
local die = getThingFromPos(areaPos)
    doSendMagicEffect(areaPos, CONST_ME_FIREATTACK)
if isPlayer(die.uid) == TRUE then
    doCreatureAddHealth(die.uid, -getCreatureMaxHealth(die.uid))
            end
        end
    end
end


function bomb()
local bombPos = {x=202, y=2086, z=10, stackpos=2} -- Position of the bomb
local bomb = getThingFromPos(bombPos)
        doTransformItem(bomb.uid, 9890, 1)
        addEvent(count4, 2*1000)
end


local playerPos = {
{x=156,y=2099,z=10}, -- Position of player 1
{x=155,y=2099,z=10}, -- Position of player 2
{x=157,y=2099,z=10}, -- Position of player 3
{x=155,y=2100,z=10}, -- Position of player 4
{x=157,y=2100,z=10} -- Position of player 5
}

local newPlayerPos = {x=199,y=2090,z=10} -- Positon where the players should get teleported when using the switch

local bomb = Action()
function bomb.onUse(cid, item, frompos, item2, topos)
local playersTeleport = {}
        for i, v in ipairs(playerPos) do
        local players = getTopCreature(v).uid or getTopCreature(v)
            if isPlayer(players) ~= TRUE then
                return FALSE
            else
                table.insert(playersTeleport, players)
            end
        end
            for i, v in ipairs(playersTeleport) do
                doTeleportThing(v, newPlayerPos)
                doPlayerSendTextMessage(cid, 19, "!!! To activation of bomb, you have only 5 minuts !!!")
                addEvent(bomb, 1000)
            end
        end
bomb:uid(5997)
bomb:register()
