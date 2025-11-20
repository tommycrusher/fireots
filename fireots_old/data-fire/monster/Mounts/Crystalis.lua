local mType = Game.createMonsterType("Crystalis")
local monster = {}

monster.description = "a Crystalis"
monster.experience = 2700
monster.outfit = {
	lookType = 149,
	lookHead = 105,
	lookBody = 105,
	lookLegs = 105,
	lookFeet = 105,
	lookAddons = 1,
	lookMount = 263
}

monster.health = 5500
monster.maxHealth = 5500
monster.race = "blood"
monster.corpse = 7344
monster.speed = 300
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 30
}

monster.strategiesTarget = {
	nearest = 50,
	health = 40,
	damage = 20,
	random = 20,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 3,
	runHealth = 100,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 5,
	color = 1
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Feel the ice of Polaris.", yell = true},
	{text = "Icccy.", yell = false},
	{text = "Let me know your frozen!", yell = false},
	{text = "I call you, spiders! Come!", yell = false}
}

monster.loot = {
	{id=2534, countmax=1, chance=100},
	{id=2479, countmax=1, chance=400},
	{id=2383, countmax=1, chance=1000},
	{id=2229, countmax=1, chance=10000},
	{id=2649, countmax=1, chance=8000},
	{id=2412, countmax=1, chance=15000},
	{id=2396, countmax=1, chance=300},
	{id=2747, countmax=1, chance=18000},
	{id=2148, countmax=20, chance=15000},
	{id=2127, countmax=1, chance=200},
	{id=2172, countmax=1, chance=200},
	{id=2032, countmax=1, chance=11000},
	{id=2144, countmax=1, chance=1500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 55, attack = 70},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -60, maxDamage = -110, radius = 1, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 2500, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -900, radius = 3, effect = CONST_ME_HITAREA, target = false},
	{name ="speed", interval = 2000, chance = 20, speedChange = -850, radius = 3, effect = CONST_ME_MAGIC_RED, target = false, duration = 25000},
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -800, radius = 7, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 65,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 100, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 480, effect = CONST_ME_MAGIC_RED, target = false, duration = 600}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 110},
	{type = COMBAT_EARTHDAMAGE, percent = 110},
	{type = COMBAT_FIREDAMAGE, percent = 150},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -100},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

monster.summons = {
    {name="Crystal Spider", interval= 5000, chance= 100}
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
