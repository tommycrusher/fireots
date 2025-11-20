local mType = Game.createMonsterType("Toxiros")
local monster = {}

monster.description = "the god of poison"
monster.experience = 300000
monster.outfit = {
	lookType = 133,
	lookHead = 38,
	lookBody = 120,
	lookLegs = 42,
	lookFeet = 95,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 125000
monster.maxHealth = 125000
monster.race = "venom"
monster.corpse = 3128
monster.speed = 540
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 50,
	health = 20,
	damage = 30,
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
	staticAttackChance = 110,
	targetDistance = 3,
	runHealth = 3000,
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
	{text = "Got antidote?", yell = false},
	{text = "The path of poisen!", yell = true},
	{text = "My dear scarab..", yell = false},
	{text = "I'm Toxic!", yell = true}
}

monster.loot = {
		{id=2142, maxCount=1, chance=3500},
		{id=2231, maxCount=1, chance=9000},
		{id=2144, maxCount=15, chance=15000},
		{id=2158, maxCount=1, chance=1500},
		{id=2195, maxCount=1, chance=4000},
		{id=2192, maxCount=1, chance=2500},
		{id=2125, maxCount=1, chance=1500},
		{id=2124, maxCount=1, chance=5500},
		{id=2520, maxCount=1, chance=15500},
		{id=2462, maxCount=1, chance=11000},
		{id=2387, maxCount=1, chance=20000},
		{id=2434, maxCount=1, chance=4500},
		{id=2167, maxCount=1, chance=13500},
		{id=2432, maxCount=1, chance=17000},
		{id=2393, maxCount=1, chance=12500},
		{id=2148, maxCount=100, chance=99900},
		{id=2148, maxCount=100, chance=88800},
		{id=2148, maxCount=100, chance=77700},
		{id=2148, maxCount=100, chance=66600},
		{id=2179, maxCount=1, chance=8000},
		{id=2470, maxCount=1, chance=5000},
		{id=2033, maxCount=1, chance=7500},
		{id=2418, maxCount=1, chance=4500},
		{id=2155, maxCount=1, chance=1500},
		{id=2396, maxCount=1, chance=7500},
		{id=2177, maxCount=1, chance=1000},
		{id=2162, maxCount=1, chance=11500},
		{id=2472, maxCount=1, chance=3000},
		{id=2514, maxCount=1, chance=7500},
		{id=2164, maxCount=1, chance=5000},
		{id=2178, maxCount=1, chance=4000},
		{id=2186, maxCount=1, chance=3500},
		{id=2176, maxCount=1, chance=12000},
		{id=2171, maxCount=1, chance=4500},
		{id=2200, maxCount=1, chance=4500},
		{id=1982, maxCount=1, chance=2600},
		{id=2214, maxCount=1, chance=13000},
		{id=2123, maxCount=1, chance=3500},
		{id=2170, maxCount=1, chance=13000},
		{id=2402, maxCount=1, chance=15500},
		{id=2436, maxCount=1, chance=5000},
		{id=2150, maxCount=20, chance=13500},
		{id=2145, maxCount=5, chance=9500},
		{id=2149, maxCount=10, chance=15500},
		{id=2146, maxCount=10, chance=13500},
		{id=2182, maxCount=1, chance=3500},
		{id=2165, maxCount=1, chance=9500},
		{id=2197, maxCount=1, chance=4000},
		{id=2174, maxCount=1, chance=2500},
		{id=2151, maxCount=7, chance=14000},
		{id=2112, maxCount=1, chance=14500},
		{id=2421, maxCount=1, chance=13500},
		{id=2377, maxCount=1, chance=20000},
		{id=2185, maxCount=1, chance=3500},
		{id=3955, maxCount=1, chance=100},
		{id=2188, maxCount=1, chance=2500},
		{id=2143, maxCount=15, chance=12500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 200, attack = 295},
	{name ="speed", interval = 2000, chance = 25, speedChange = -700, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true, duration = 15000},
	{name ="combat", interval = 3000, chance = 12, type = COMBAT_MANADRAIN, minDamage = -350, maxDamage = -650, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_POISONDAMAGE, minDamage = -850, maxDamage = -1500, radius = 6, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -900, radius = 3, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -1200, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -600, radius = 6, effect = CONST_ME_MORTAREA, target = false},
	{name ="strength", interval = 1000, chance = 6, minDamage = -300, maxDamage = -650, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 1000, chance = 4, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -900, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -850, radius = 4, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -166, maxDamage = -520, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false}
}

monster.defenses = {
	defense = 50,
	armor = 70,
	{name ="combat", interval = 1000, chance = 2, type = COMBAT_HEALING, minDamage = 6000, maxDamage = 8000, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 1000, chance = 3, speedChange = 980, effect = CONST_ME_MAGIC_RED, target = false, duration = 9000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
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
    {name="Warlock", interval= 1000, chance= 10}
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
