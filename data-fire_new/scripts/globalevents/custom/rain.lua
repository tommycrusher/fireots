--if configManager.getBoolean(configKeys.WEATHER_RAIN) then
	weatherConfig = {
	    groundEffect = CONST_ME_LOSEENERGY,
	    fallEffect = CONST_ANI_ICE,
	    thunderEffect = true,
	    minDMG = 5,
	    maxDMG = 10
	}

	local function sendWeatherEffect(self, groundEffect, fallEffect, thunderEffect)
	    local position, random = self:getPosition(), math.random
	    position.x = position.x + random(-4, 4)
	      position.y = position.y + random(-4, 4)

	    local fromPosition = Position(position.x + 1, position.y, position.z)
	       fromPosition.x = position.x - 7
	       fromPosition.y = position.y - 5

	    local tile, getGround
	    for Z = 1, 7 do
		fromPosition.z = Z
		position.z = Z

		tile = Tile(position)
		if tile then -- If there is a tile, stop checking floors
		    fromPosition:sendDistanceEffect(position, fallEffect)
		    position:sendMagicEffect(groundEffect, self)

		    getGround = tile:getGround()
		    if getGround and ItemType(getGround:getId()):getFluidSource() == 1 then
		        position:sendMagicEffect(CONST_ME_WATERSPLASH, self)
		    end
		    break
		end
	    end

	    if thunderEffect and tile then
		if random(2) == 1 then
		    local topCreature = tile:getTopCreature()

		    if topCreature and topCreature:isPlayer() then
		        position:sendMagicEffect(CONST_ME_BIGCLOUDS, self)
		        doTargetCombatHealth(0, self, COMBAT_ENERGYDAMAGE, -weatherConfig.minDMG, -weatherConfig.maxDMG, CONST_ME_NONE)
		        self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were hit by lightning and lost some health.")
		    end
		end
	    end
	end
	
	local weatherStartup = GlobalEvent("WeatherStartup")

	function weatherStartup.onStartup()
		local rain = math.random(100)
		if rain > 95 then
			Game.setStorageValue('Weather', 1)
		else
			Game.setStorageValue('Weather', 0)
		end
		return true
	end

	weatherStartup:register()

	local weather = GlobalEvent("Weather")

	function weather.onThink(interval, lastExecution)
		local rain = math.random(100)
		if rain > 95 then
			Game.setStorageValue('Weather', 1)
		else
			Game.setStorageValue('Weather', 0)
		end
		return true
	end

	weather:interval(200000) -- how often to randomize rain / weather
	weather:register()

	local weatherRain = GlobalEvent("WeatherRain")

	function weatherRain.onThink(interval, lastExecution)
		if Game.getStorageValue('Weather') == 1 then
			local players = Game.getPlayers()
			if #players == 0 then
				return true
			end
			local player
			for i = 1, #players do
				player = players[i]
				sendWeatherEffect(player, weatherConfig.groundEffect, weatherConfig.fallEffect, weatherConfig.thunderEffect)
			end
		end
		return true
	end

weatherRain:interval(50) -- less rain = greater value
weatherRain:register()
--end
