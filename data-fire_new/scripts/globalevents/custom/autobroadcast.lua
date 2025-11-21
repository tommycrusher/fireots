local messages = {
	[1] = {text = "Remember to visit the forum for the latest information about released patches. http://fireots.pl/forum"},
	[2] = {text = "~ KONKURS  na  FireOTS ! ~  Zrob Najlepszy Screen Z Eventu  #  Do Wygrania 20 PKT do SMS Shopu  # Masz Pomysl?, Nie Marnuj Go!.  Screeny Wrzucajcie na Nasze Forum !  Wiecej Informacji Na Stronie Glownej. Pozdrawiamy."},
	[3] = {text = "Help the server by either donating or bumping our advertisement thread on tibia.net.pl"},
	[4] = {text = "~ KONKURS  na  FireOTS ! ~  Zrob Najlepszy Screen Z Eventu  #  Do Wygrania 20 PKT do SMS Shopu  # Masz Pomysl?, Nie Marnuj Go!.  Screeny Wrzucajcie na Nasze Forum !  Wiecej Informacji Na Stronie Glownej. Pozdrawiamy."},
	[5] = {text = "Please think twice before you kill a dog. They just want to be your friend!"},
	[6] = {text = "Don't throw empty backpacks on the floor, that's what trashcans are for! If you litter, we will take all backpacks out of the game and there will be no more backpacks, ever."},
	[7] = {text = "~ KONKURS  na  FireOTS ! ~  Zrob Najlepszy Screen Z Eventu  #  Do Wygrania 20 PKT do SMS Shopu  # Masz Pomysl?, Nie Marnuj Go!.  Screeny Wrzucajcie na Nasze Forum !  Wiecej Informacji Na Stronie Glownej. Pozdrawiamy."},
	[8] = {text = "With great power comes great responsibility"},
	[9] = {text = "Your account has been banned! This is a joke but this would be real if you use third party software!"},
	[10] = {text = "Visit the official homepage on a regular basis to have an overview of the latest news."},
	[11] = {text = "~ KONKURS  na  FireOTS ! ~  Zrob Najlepszy Screen Z Eventu  #  Do Wygrania 20 PKT do SMS Shopu  # Masz Pomysl?, Nie Marnuj Go!.  Screeny Wrzucajcie na Nasze Forum !  Wiecej Informacji Na Stronie Glownej. Pozdrawiamy."},
	[12] = {text = "Invite friends to play, make a guild, make money, find rare items, become a legend."},
	[13] = {text = "You will never forget your first dragon."},
	[14] = {text = "Facebook users beware you can get hacked trough it, never accept or visit sites or links you dont trust."},
	[15] = {text = "When someone threatens to kill you if you don't give them your armor, give them nothing, as they might kill you anyway."},
	[16] = {text = "~ KONKURS  na  FireOTS ! ~  Zrob Najlepszy Screen Z Eventu  #  Do Wygrania 20 PKT do SMS Shopu  # Masz Pomysl?, Nie Marnuj Go!.  Screeny Wrzucajcie na Nasze Forum !  Wiecej Informacji Na Stronie Glownej. Pozdrawiamy."},
	[17] = {text = "Playing Tibia is a combination of having an angel on your shoulder and the devil in your head."},
	[18] = {text = "Never believe in a cloning items by Ctrl + L or Ctrl + Q."},
	[19] = {text = "Although you are allowed to attack people on PvP worlds, there is a 99.9999% chance you will get hunted for it."},
	[20] = {text = "This game is to be fun, but play it for long hours can be harmful to health. Take care!"},
	[21] = {text = "If you die, you loose items, skills and experience. But if you don't hunt, you'll never get them back"},
	[22] = {text = "Got spammed? Hold Ctrl+W in order to clear your gamescreen from text!"},
	[23] = {text = "Tired of getting your private channel full of casted spells? Put #s infront of your spellhotkeys (example: #s exori vis), then your spells will only appear in default channel!"},
	[24] = {text = "By pressing Alt + F8 you can check your current Framerate."},
	[25] = {text = "The most important thing in Tibia is not to be the guy with the most high level, is be the guy with the most best friends"}
}


local autobroadcast = GlobalEvent("AutoBroadcast")
function autobroadcast.onThink(player, interval, lastExecution)
	local i = 0
	local message = messages[math.random(#messages)].text
	local messageType = TALKTYPE_CHANNEL_O

	--Game.broadcastMessage("Information: " .. message .. "", messageType)
	--for _, targetPlayer in ipairs(Game.getPlayers()) do
	--	targetPlayer:sendPrivateMessage(player, message, TALKTYPE_BROADCAST)
	--end
	--for _, player in ipairs(Game.getPlayers()) do
	--	player:sendTextMessage(messageType, message)
	--end
	sendChannelMessage(5, messageType, message)
	print("> Broadcasted message: \"" .. message .. "\".")

	--player:sendChannelMessage(author, text, type, 5)
	--player:sendPrivateMessage(speaker, text[, type])
	--player:sendTextMessage(type, text[, position, primaryValue = 0, primaryColor = TEXTCOLOR_NONE[, secondaryValue = 0, secondaryColor = TEXTCOLOR_NONE]])
	i = i + 1
	return true
end
autobroadcast:interval(720000)
autobroadcast:register()
