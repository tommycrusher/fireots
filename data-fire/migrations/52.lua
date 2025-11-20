function onUpdateDatabase()
	logger.info("Updating database to version 52 (missing constraints + delete cascade)")

	-- Clean orphaned records first to prevent foreign key errors
	logger.info("Cleaning orphaned records...")
	
	-- Delete orphaned player_charms
	db.query([[DELETE FROM `player_charms` WHERE `player_id` NOT IN (SELECT `id` FROM `players`)]])
	
	-- Delete orphaned player_prey
	db.query([[DELETE FROM `player_prey` WHERE `player_id` NOT IN (SELECT `id` FROM `players`)]])
	
	-- Delete orphaned player_taskhunt
	db.query([[DELETE FROM `player_taskhunt` WHERE `player_id` NOT IN (SELECT `id` FROM `players`)]])
	
	-- Delete orphaned player_bosstiary
	db.query([[DELETE FROM `player_bosstiary` WHERE `player_id` NOT IN (SELECT `id` FROM `players`)]])

	-- Drop existing constraints if they exist (ignore errors)
	-- this one had no ON DELETE CASCADE, need to re-create it
	pcall(function()
		db.query([[ALTER TABLE `player_charms` DROP CONSTRAINT player_charms_players_fk]])
	end)

	-- this one had wrong name, just correcting it
	pcall(function()
		db.query([[ALTER TABLE `player_taskhunt` DROP PRIMARY KEY]])
	end)

	-- Add constraints (skip if already exist)
	pcall(function()
		db.query([[
			ALTER TABLE account_vipgroups
			ADD CONSTRAINT account_vipgroups_accounts_fk
				FOREIGN KEY (account_id) REFERENCES accounts (id)
				ON DELETE CASCADE
		]])
	end)

	pcall(function()
		db.query([[
			ALTER TABLE players_online
			ADD CONSTRAINT players_online_players_fk
				FOREIGN KEY (player_id) REFERENCES players (id)
				ON DELETE CASCADE
		]])
	end)

	pcall(function()
		db.query([[
			ALTER TABLE player_charms
			ADD CONSTRAINT player_charms_players_fk
				FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
				ON DELETE CASCADE
		]])
	end)

	pcall(function()
		db.query([[
			ALTER TABLE player_kills
			ADD CONSTRAINT `player_kills_players_fk`
				FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
				ON DELETE CASCADE
		]])
	end)

	pcall(function()
		db.query([[
			ALTER TABLE player_prey
			ADD CONSTRAINT `player_prey_players_fk`
				FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
				ON DELETE CASCADE
		]])
	end)

	pcall(function()
		db.query([[
			ALTER TABLE player_taskhunt
			ADD CONSTRAINT `player_taskhunt_pk` PRIMARY KEY (`player_id`, `slot`),
			ADD CONSTRAINT `player_taskhunt_players_fk`
				FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
				ON DELETE CASCADE
		]])
	end)

	pcall(function()
		db.query([[
			ALTER TABLE player_bosstiary
			ADD CONSTRAINT `player_bosstiary_players_fk`
				FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
				ON DELETE CASCADE
		]])
	end)

	pcall(function()
		db.query([[
			ALTER TABLE player_stash
			ADD CONSTRAINT `player_stash_players_fk`
				FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
				ON DELETE CASCADE
		]])
	end)
	
	logger.info("Migration 52 completed successfully")
end
