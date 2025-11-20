local mType = Game.createMonsterType("Donator Nightmare")
local monster = {}

monster.description = "a Donator Nightmare"
monster.experience = 5150
monster.outfit = {
	lookType = 245,
	lookHead = 0,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4750
monster.maxHealth = 4750
monster.race = "blood"
monster.corpse = 6340
monster.speed = 500
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
	staticAttackChance = 90,
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
	{text = "Close your eyes... I want to show you something!", yell = true},
	{text = "I will haunt you forever!", yell = true},
	{text = "I will make you scream!", yell = true},
	{text = "Your resistance is futile!", yell = true}
}

monster.loot = {
	{id = 2148, maxCount = 70, chance = 100000}, -- gold coin
    {id = 2148, maxCount = 70, chance = 100000}, --Gold Coin
	{id = 2152, chance = 22222, maxCount = 4}, -- platinum coin
	{id = 2666, chance = 20000, maxCount = 4}, -- meat
	{id = 2671, chance = 50000, maxCount = 2}, -- ham
	{id = 2230, chance = 12500}, -- bone
	{id = 6558, chance = 11700}, -- Concentrated Demonic Blood
	{id = 6558, chance = 9800}, -- Concentrated Demonic Blood
	{id = 2532, chance = 6700}, -- ancient shield
	{id = 6500, chance = 4500, maxCount = 2}, -- demonic essence
	{id = 2387, chance = 7777}, -- double axe
	{id = 1987, chance = 100000}, -- bag

			{id = 2491, chance = 5700}, --Crown Helmet
			{id = 7419, chance = 1100}, -- dreaded claver
			{id = 5944, chance = 12400, maxCount = 1}, -- soul orb
			{id = 2457, chance = 9850}, -- steel helmet
			{id = 6300, chance = 1429}, -- death ring
			{id = 2477, chance = 2900}, -- knight legs
			{id = 2195, chance = 1200}, -- boots of haste
			{id = 6526, chance = 1666}, -- skeleton decoration
			{id = 5810, chance = 900} -- voodoo skull
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 23, attack = 21},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -80, maxDamage = -190, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -85, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 6000},
	{name ="strength", interval = 1000, chance = 10, minDamage = -60, maxDamage = -145, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -80, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -60, maxDamage = -70, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -40, maxDamage = -80, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -80, maxDamage = -100, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -60, maxDamage = -120, radius = 14, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 145,
	armor = 188,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 100, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 48, effect = CONST_ME_MAGIC_RED, target = false, duration = 600}
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
