local mType = Game.createMonsterType("Lazarus")
local monster = {}

monster.description = "the god of energy"
monster.experience = 29000
monster.outfit = {
	lookType = 133,
	lookHead = 57,
	lookBody = 87,
	lookLegs = 0,
	lookFeet = 119,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 914
monster.Bestiary = {
	class = "Bird",
	race = BESTY_RACE_BIRD,
	toKill = 50,
	FirstUnlock = 5,
	SecondUnlock = 25,
	CharmsPoints = 300,
	Stars = 2,
	Occurrence = 0,
	Locations = "Enigma."
	}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "fire"
monster.corpse = 3128
monster.speed = 540
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "The keeper of ENERGY! BRrZzzZzZZZ!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 64090, maxCount = 23},
	{name = "meat", chance = 19950, maxCount = 2},
	{id = 2667, chance = 20320, maxCount = 2},--fish
	{name = "worm", chance = 14730, maxCount = 2},
	{name = "marsh stalker feather", chance = 8650},
	{name = "longsword", chance = 7560},
	{name = "marsh stalker beak", chance = 6080},
	{id = 2120, chance = 4830},--rope
	{name = "seeds", chance = 110}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -10},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -8, range = 7, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONAREA, target = true}
}

monster.defenses = {
	defense = 3,
	armor = 3
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
