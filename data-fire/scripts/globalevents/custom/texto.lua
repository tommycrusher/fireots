local config = {
    positions = {
        ["Items"] = { x = 105, y = 2038, z = 7 },--armonia
        ["Train"] = { x = 95, y = 2038, z = 7 },
        ["Exp Tp"] = { x = 167, y = 52, z = 7 },
        ["ExpTp!"] = { x = 1029, y = 1002, z = 7 },
        ["Exp First"] = { x = 153, y = 56, z = 7 },
        ["FirstExp"] = { x = 1000, y = 999, z = 7 },--enigma
        ["First Exp"] = { x = 1026, y = 994, z = 7 },
        ["Tp Exp"] = { x = 995, y = 999, z = 7 },
        ["Exp 100lvl"] = { x = 998, y = 997, z = 8 },
        ["Exp100lvl"] = { x = 1026, y = 1002, z = 7 },
        ["Shops"] = { x = 996, y = 1002, z = 7 },
        ["Trainers"] = { x = 995, y = 998, z = 7 },
        ["Depot"] = { x = 996, y = 995, z = 7 },
        ["Temple"] = { x = 1026, y = 995, z = 7 },
        ["U1 Orsh!"] = { x = 1004, y = 995, z = 7 },
        ["Armonia"] = { x = 1026, y = 1006, z = 7 },
        ["Ivllos"] = { x = 1026, y = 1007, z = 7 },
        ["Enigma"] = { x = 155, y = 52, z = 7 },
        ["Easy"] = { x = 939, y = 948, z = 7 },
        ["Medium"] = { x = 941, y = 948, z = 7 },
        ["Hard"] = { x = 943, y = 948, z = 7 },
	["HUNTING"] = {x = 1004, y = 1002, z = 7},
        ["TRAINER"] = { x = 1026, y = 1003, z = 7 },
        ["TRAIN NEW"] = { x = 1026, y = 1008, z = 7 },
	["NPC"] = {x = 1026, y = 1004, z = 7},
	["QUESTS"] = {x = 1005, y = 1000, z = 7},
	["QUEST"] = {x = 182, y = 52, z = 7},
	["Q UEST"] = {x = 668, y = 776, z = 7},
	["Q UESTS"] = {x = 2402, y = 826, z = 7},
	["QUEST!"] = {x = 3001, y = 1416, z = 7},
	["QUESTS!"] = {x = 152, y = 1553, z = 7},
	["!QUEST"] = {x = 2649, y = 2887, z = 7},
	["!QUESTS"] = {x = 1026, y = 1005, z = 7},
	["Readme!"] = {x = 2643, y = 2889, z = 7},
	["Train"] = {x = 1001, y = 1004, z = 7},
	["Train!"] = {x = 2643, y = 2889, z = 7},
	["TRAIN"] = {x = 1028, y = 993, z = 7},
	["TRAIN!"] = {x = 1002, y = 994, z = 7}
    }
}
local effects = {39, 35}
local textto = GlobalEvent("TextTo")
function textto.onThink(interval)
    for text, pos in pairs(config.positions) do
    Position(math.random(1, #pos)):sendMagicEffect(math.random(1, #effects))
		--doSendMagicEffect(pos, effects[math.random(1, #effects)])
        --doSendAnimatedText(pos, text, math.random(1, 255))doShowTextDialog(cid, itemId, text)
    end
    
    return TRUE
end
--textto:interval(1000)
--textto:register() 
