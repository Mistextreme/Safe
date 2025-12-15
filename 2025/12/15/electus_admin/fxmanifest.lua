fx_version("cerulean")
author("@electus_scripts (ELECTUS SCRIPTS)")
version("1.2.1")
lua54("yes")

games({
	"gta5",
})

client_scripts({
	-- "@qbx_core/modules/playerdata.lua", -- uncomment this if you are using Qbox
	"client/**/*",
	"escrowed/client/*",
})

shared_scripts({
	"config/**/*",
	"shared/**/*",
	"escrowed/shared/*",
	"@ox_lib/init.lua",
	-- "@qbx_core/modules/lib.lua", -- uncomment this if you are using Qbox
})

server_scripts({
	"@oxmysql/lib/MySQL.lua",
	"server/**/*",
	"escrowed/server/*",
	"server_config/*",
	"backend/dist/index.js",
})

files({
	"ui/build/index.html",
	"ui/build/**/*",
	"config/locales/*.lua",
})

ui_page("ui/build/index.html")
-- ui_page("http://localhost:5173")

server_exports({
	"GetTotalBank",
	"GetPlayerCount",
	"GetTotalCash",
	"GetStaffOnline",
	"GetPeakPlayers",
	"Announce",
	"KickAll",
	"ReviveAll",
	"SetTime",
	"SetWeather",
	"DeleteAllVehicles",
	"DeleteAllPeds",
	"DeleteAllProps",
	"GetAllPlayers",
	"GetExtendedPlayer",
	"GetOnlinePlayers",
	"GetVehiclesInDatabase",
	"GetSpecificVehicleInDatabase",
	"TransferVehicleOwnership",
	"RepairVehicle",
	"FlipVehicle",
	"DeleteVehicle",
	"UpdateGarage",
	"FreezeAllPlayers",
	"IdentifierGetInventory",
	"IdentifierAddItem",
	"IdentifierRemoveItemAmount",
	"IdentifierSetItem",
	"RemoveCountFromAllPlayers",
	"AddItemCountToAllPlayers",
	"SetItemCountForAllPlayers",
	"GetItems",
	"GetItemPlayers",
	"GetDailyStatistics",
	"GetWeeklyStatistics",
	"GetMonthlyStatistics",
	"ChangePlate",
	"RemoveVehicleFromDatabase",
	"GetGarages",
	"GetMapData",
})

escrow_ignore({
	"client/**",
	"server/**",
	"shared/**",
	"config/**",
	"server_config/**",
})

dependency '/assetpacks'