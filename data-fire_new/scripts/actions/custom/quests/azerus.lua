function Potwory1()
	doSummonCreature("Rift Worm", {x=1189,y=984,z=10})
	doSummonCreature("Rift Worm", {x=1197,y=988,z=10})
	doSummonCreature("Rift Worm", {x=1189,y=983,z=10})
	doSummonCreature("Rift Worm", {x=1197,y=983,z=10})

end

function Potwory2()
	doSummonCreature("Rift Brood", {x=1189,y=984,z=10})
	doSummonCreature("Rift Brood", {x=1197,y=988,z=10})
	doSummonCreature("Rift Brood", {x=1189,y=983,z=10})
	doSummonCreature("Rift Brood", {x=1197,y=983,z=10})
end

function Potwory3()
	doSummonCreature("Rift Scythe", {x=1189,y=984,z=10})
	doSummonCreature("Rift Scythe", {x=1197,y=988,z=10})
	doSummonCreature("Rift Scythe", {x=1189,y=983,z=10})
	doSummonCreature("Rift Scythe", {x=1197,y=983,z=10})
end

function Potwory4()
	doSummonCreature("Azerus", {x=1193,y=985,z=10})
	doSummonCreature("War Golem", {x=1189,y=984,z=10})
	doSummonCreature("War Golem", {x=1197,y=988,z=10})
	doSummonCreature("War Golem", {x=1189,y=983,z=10})
	doSummonCreature("War Golem", {x=1197,y=983,z=10})
end
local potwory = Action()
function potwory.onUse(cid, item, frompos, item2, topos)

	addEvent(Potwory1, 0)
	addEvent(Potwory2, 5000)
	addEvent(Potwory3, 10000)
	addEvent(Potwory4, 15000)
	return TRUE
end
potwory:aid(11223)
potwory:register()
