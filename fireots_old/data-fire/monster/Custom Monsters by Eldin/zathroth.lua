local mType = Game.createMonsterType("Zathroth")
local monster = {}

monster.description = "zathroth the god of the elements"
monster.experience = 39999
monster.outfit = {
	lookType = 145,
	lookHead = 20,
	lookBody = 95,
	lookLegs = 114,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 280000
monster.maxHealth = 280000
monster.race = "venom"
monster.corpse = 3128
monster.speed = 390
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 20
}

monster.strategiesTarget = {
	nearest = 70,
	health = 20,
	damage = 50,
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
	staticAttackChance = 60,
	targetDistance = 1,
	runHealth = 2500,
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
	{text = "Want to feel some Aim?", yell = true},
	{text = "You can Run but never Hide!", yell = true}
}

monster.loot = {
		{ id=2142, maxCount=1, chance=3500},
		{ id=2144, maxCount=15, chance=15000},
		{ id=2158, maxCount=1, chance=1500},
		{ id=2195, maxCount=1, chance=4000},
		{ id=2186, maxCount=1, chance=3500},
		{ id=2192, maxCount=1, chance=2500},
		{ id=2125, maxCount=1, chance=1500},
		{ id=2124, maxCount=1, chance=5500},
		{ id=2520, maxCount=1, chance=15500},
		{ id=2462, maxCount=1, chance=11000},
		{ id=2387, maxCount=1, chance=20000},
		{ id=2434, maxCount=1, chance=4500},
		{ id=2167, maxCount=1, chance=13500},
		{ id=2432, maxCount=1, chance=17000},
		{ id=2393, maxCount=1, chance=12500},
		{ id=2148, maxCount=100, chance=99900},
		{ id=2148, maxCount=100, chance=88800},
		{ id=2148, maxCount=100, chance=77700},
		{ id=2148, maxCount=100, chance=66600},
		{ id=2179, maxCount=1, chance=8000},
		{ id=2470, maxCount=1, chance=5000},
		{ id=2033, maxCount=1, chance=7500},
		{ id=2418, maxCount=1, chance=4500},
		{ id=2182, maxCount=1, chance=3500},
		{ id=2155, maxCount=1, chance=1500},
		{ id=2188, maxCount=1, chance=2500},
		{ id=2396, maxCount=1, chance=7500},
		{ id=2177, maxCount=1, chance=1000},
		{ id=2162, maxCount=1, chance=11500},
		{ id=2472, maxCount=1, chance=3000},
		{ id=2514, maxCount=1, chance=7500},
		{ id=2164, maxCount=1, chance=5000},
		{ id=2178, maxCount=1, chance=4000},
		{ id=2176, maxCount=1, chance=12000},
		{ id=2171, maxCount=1, chance=4500},
		{ id=2200, maxCount=1, chance=4500},
		{ id=1982, maxCount=1, chance=2600},
		{ id=2214, maxCount=1, chance=13000},
		{ id=2123, maxCount=1, chance=3500},
		{ id=2170, maxCount=1, chance=13000},
		{ id=2402, maxCount=1, chance=15500},
		{ id=2436, maxCount=1, chance=5000},
		{ id=2150, maxCount=20, chance=13500},
		{ id=2145, maxCount=5, chance=9500},
		{ id=2149, maxCount=10, chance=15500},
		{ id=2146, maxCount=10, chance=13500},
		{ id=2165, maxCount=1, chance=9500},
		{ id=2197, maxCount=1, chance=4000},
		{ id=2174, maxCount=1, chance=2500},
		{ id=2151, maxCount=7, chance=14000},
		{ id=2112, maxCount=1, chance=14500},
		{ id=2421, maxCount=1, chance=13500},
		{ id=2377, maxCount=1, chance=20000},
		{ id=3955, maxCount=1, chance=100},
		{ id=2185, maxCount=1, chance=3500},
		{ id=2143, maxCount=15, chance=12500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 165, attack = 255},
	{name ="combat", interval = 3000, chance = 12, type = COMBAT_MANADRAIN, minDamage = -350, maxDamage = -650, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_POISONDAMAGE, minDamage = -350, maxDamage = -900, radius = 6, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 3000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -400, radius = 6, effect = CONST_ME_MORTAREA, target = false},
	{name ="strength", interval = 1000, chance = 6, minDamage = -200, maxDamage = -450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -700, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -1900, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -850, radius = 4, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 90,
	armor = 110,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1000, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 1000, chance = 3, speedChange = 980, effect = CONST_ME_MAGIC_RED, target = false, duration = 9000},
	{name ="invisible", interval = 2000, chance = 3, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 20},
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
    {name="Warlock", interval= 1000, chance= 50}
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
