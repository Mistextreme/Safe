Config = {
	framework = "esx", -- "esx", "qb" or "qbx"
	inventory = "qs-inventory", -- "ox_inventory", "qs-inventory", "core_inventory", "qb-inventory"
	garage = "jg-advancedgarages", -- "esx_garage", "qb-garages", "jg-advancedgarages" -- if unsure use "esx_garage" or "qb-garages" as they set a standard for the database structure.
	locale = "en",
	keyActions = { -- if you change KeyActions the Key must also be avaliable in Keys table.
		cancel = "BACKSPACE",
	},
	menuCommand = "adminmenu", -- command to open the menu
	serverIp = "62.199.34.123", -- your server ip
	serverPort = 30120, -- your server port
	inventoryPath = "/html/images",
	statistics = {
		jobs = { -- what jobs to track
			"police",
			"ambulance",
			"mechanic",
			"taxi",
		},
		items = { -- what weapons to track
			"weapon_pistol",
			"weapon_combatpistol",
			"weapon_assaultrifle",
		},
	},
}
