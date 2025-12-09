fx_version 'cerulean'
game 'gta5'

author 'Bagieta'
version '1.0.6'
description 'Advanced Garages by otherplanet.dev | ESX/QBCORE SUPPORTED.'
lua54 'yes'

ui_page 'ui/index.html'
 
files {
	'ui/**'
}

shared_scripts {
	'framework/shared.lua',
	'locales/*.lua',
	'config/config.lua',
	'config/*.lua'
}

client_scripts {
	'framework/client/c_framework.lua',
	'client/*.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'framework/server/s_framework.lua',
	'server/*.lua',
}

escrow_ignore {
	'framework/**',
	'client/**',
	'server/**',
	'locales/**',
	'config/*.lua'
}
dependency '/assetpacks'