fx_version 'cerulean'

games { 'gta5' }
lua54 'yes'

ui_page 'index.html'

files{
  'html/index.html',
  'html/index.css',
  'html/index.js',
  'html/lib.js',
}


shared_scripts {
  '@ox_lib/init.lua',
}

client_scripts{ 
    ---Vendors RageUI
    'autres/data.lua',
    "vendors/Rage/RMenu.lua",
    "vendors/Rage/menu/RageUI.lua",
    "vendors/Rage/menu/Menu.lua",
    "vendors/Rage/menu/MenuController.lua",
    "vendors/Rage/components/*.lua",
    "vendors/Rage/menu/elements/*.lua",
    "vendors/Rage/menu/items/*.lua",
    "vendors/Rage/menu/panels/*.lua",
    "vendors/Rage/menu/windows/*.lua",
}



server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "shared/config_server.lua",
    "shared/webhook.lua",
    "server/server.lua"
}


client_scripts {
    "shared/config_client.lua",
    "client/client.lua"
}



dependency {
  'ox_lib',
  'oxmysql',
  'screenshot-basic',
}

escrow_ignore {
  "vendors/Rage/menu/Menu.lua",
  "shared/config_server.lua",
  "shared/config_client.lua",
  "shared/webhook.lua",
  "autres/*.json",
}

dependency '/assetpacks'