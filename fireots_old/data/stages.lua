-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 80,
	},
	{
		minlevel = 9,
		maxlevel = 20,
		multiplier = 60,
	},
	{
		minlevel = 21,
		maxlevel = 50,
		multiplier = 50,
	},
	{
		minlevel = 51,
		maxlevel = 100,
		multiplier = 40,
	},
	{
		minlevel = 101,
		maxlevel = 200,
		multiplier = 20,
	},
		{
		minlevel = 201,
		maxlevel = 300,
		multiplier = 10,
	},
			{
		minlevel = 301,
		multiplier = 3,
	},
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 105,
	},
	{
		minlevel = 61,
		maxlevel = 80,
		multiplier = 80,
	},
	{
		minlevel = 81,
		maxlevel = 110,
		multiplier = 40,
	},
	{
		minlevel = 111,
		maxlevel = 125,
		multiplier = 10,
	},
	{
		minlevel = 126,
		multiplier = 3,
	},
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 100,
	},
	{
		minlevel = 61,
		maxlevel = 80,
		multiplier = 70,
	},
	{
		minlevel = 81,
		maxlevel = 100,
		multiplier = 50,
	},
	{
		minlevel = 101,
		maxlevel = 110,
		multiplier = 40,
	},
	{
		minlevel = 111,
		maxlevel = 125,
		multiplier = 30,
	},
	{
		minlevel = 126,
		multiplier = 5,
	},
}
