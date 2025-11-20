local mType = Game.createMonsterType("Random Noob")
local monster = {}

monster.description = "a random noob"
monster.experience = 148000
monster.outfit = {
	lookType = 129,
	lookHead = 36,
	lookBody = 83,
	lookLegs = 116,
	lookFeet = 78,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 99000
monster.maxHealth = 99000
monster.race = "blood"
monster.corpse = 2212
monster.speed = 390
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 3,
	runHealth = 50,
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
	{text = "Come here, free itenz!", yell = true},
	{text = "Come, look! A bug!", yell = true},
	{text = "I found a bug! Come and look!", yell = true},

}

monster.loot = {
	{id = 3025, chance = 13500}, --ancient amulet
	{name = "black pearl", chance = 15000, maxCount = 35},
	{name = "boots of haste", chance = 14000},
	{name = "crystal necklace", chance = 21500},
	{name = "demon shield", chance = 15500},
	{name = "devil helmet", chance = 11000},
	{name = "dragon hammer", chance = 34500},
	{id = 3051, chance = 13500}, --energy ring
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
	{id = 3209, chance = 5100}, -- voodoo doll
	{name = "white pearl", chance = 12500, maxCount = 35}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 80, skill = 90, attack = 110},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -900, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -650, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 10, minDamage = -200, maxDamage = -450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -200, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -200, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -300, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -500, maxDamage = -800, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -500, radius = 14, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 93,
	armor = 90,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 300, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 680, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 80},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}
monster.summons = {
    {name="Magebomb", interval= 5000, chance= 100}
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
