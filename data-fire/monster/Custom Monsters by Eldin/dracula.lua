local mType = Game.createMonsterType("Dracula")
local monster = {}

monster.description = "the known dracula"
monster.experience = 2000
monster.outfit = {
	lookType = 68,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000
monster.maxHealth = 5000
monster.race = "undead"
monster.corpse = 2956
monster.speed = 300
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 50,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
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
	{text = "BLOOD!", yell = true},
	{text = "Let me kiss your neck.", yell = false},
	{text = "I smell warm blood.", yell = false},
	{text = "I call you, my bats! Come!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, skill = 75, attack = 55},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -60, maxDamage = -110, radius = 1, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -350, radius = 3, effect = CONST_ME_MAGIC_RED, target = false, duration = 30000},
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_DEATHDAMAGE, minDamage = -50, maxDamage = -80, radius = 7, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 38,
	armor = 27,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 100, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 480, effect = CONST_ME_MAGIC_RED, target = false, duration = 600},
	{name ="outfit", interval = 1000, chance = 100, monster = bat, effect = CONST_ME_SHIMMER_BLUE, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 110},
	{type = COMBAT_EARTHDAMAGE, percent = 110},
	{type = COMBAT_FIREDAMAGE, percent = 120},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 150},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}
monster.summons = {
    {name="Vampire", interval= 5000, chance= 100}
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
