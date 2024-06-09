local mType = Game.createMonsterType("The Fastest Turtle")
local monster = {}

monster.description = "a The fastest turtle"
monster.experience = 400000
monster.outfit = {
	lookType = 303,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 480000
monster.maxHealth = 480000
monster.race = "venom"
monster.corpse = 9780
monster.speed = 1000
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 40
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Ahhnn? human? kill everyone? or let live? I am wrong? I am Confused!", yell = true},
	{text = "where is my leader? Is he on the cover of a book? I am Confused...", yell = true}
}

monster.loot = {
	{name = "ancient amulet", chance = 13500},
	{id = 2231, chance = 19000}, -- big bone
	{name = "black pearl", chance = 15000, maxCount = 35},
	{name = "boots of haste", chance = 14000},
	{id = 2192, chance = 22500}, -- crystal ball
	{name = "crystal necklace", chance = 21500},
	{id = 2124, chance = 15500}, -- crystal ring
	{name = "demon shield", chance = 15500},
	{name = "devil helmet", chance = 11000},
	{name = "dragon hammer", chance = 34500},
	{name = "energy ring", chance = 13500},
	{name = "fire axe", chance = 17000},
	{name = "giant sword", chance = 12500},
	{name = "platinum coin", chance = 69900, maxCount = 100},
	{name = "platinum coin", chance = 68800, maxCount = 100},
	{name = "crystal coin", chance = 47700, maxCount = 40},
	{name = "crystal coin", chance = 36600, maxCount = 15},
	{name = "gold ring", chance = 28000},
	{name = "golden legs", chance = 15000},
	{name = "giant ruby", chance = 31500},
	{name = "giant sapphire", chance = 31500},
	{name = "giant emerald", chance = 31500},
	{name = "ice rapier", chance = 27500},
	{name = "magic plate armor", chance = 13000},
	{name = "mastermind shield", chance = 17500},
	{name = "purple tome", chance = 12600},
	{name = "ring of the sky", chance = 13500},
	{name = "silver dagger", chance = 15500},
	{name = "skull staff", chance = 25000},
	{name = "talon", chance = 14000, maxCount = 27},
	{name = "teddy bear", chance = 10500},
	{name = "thunder hammer", chance = 3500},
	{id = 3955, chance = 5100}, -- voodoo doll
	{name = "white pearl", chance = 12500, maxCount = 35},
	{id = 3031, maxCount = 100, chance = 100000}, --Gold
	{id = 3031, maxCount = 50, chance = 100000}, -- Gold
	{id = 3035, maxCount = 6, chance = 80000}, --Platinum
	{id = 3027, maxCount = 28, chance = 7777}, --Black Pearls
	{id = 7440, chance = 17000}, --Mastermind potion
	{id = 3210, chance = 4500}, --hat of the made
	{id = 2854, chance = 100000},
	{id = 3034, maxCount = 13, chance = 6500}, --Talons
	{id = 8064, chance = 6555}, --ethno coat
	{id = 8090, chance = 8200} --Spellbook of dark mysteries
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 230, attack = 210},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -1900, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -850, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 10, minDamage = -600, maxDamage = -1450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -800, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -700, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -800, maxDamage = -1000, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -1200, radius = 14, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 145,
	armor = 188,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 480, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
