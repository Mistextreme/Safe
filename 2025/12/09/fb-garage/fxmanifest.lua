fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'lua/shared/*.lua'
}

client_scripts {
    "RageUI/RMenu.lua", "RageUI/menu/RageUI.lua", "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua", "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua", "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua", "RageUI/menu/windows/*.lua",
    'lua/client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'lua/server/*.lua'
}

files {
    "web/assets/*.svg",
    "web/assets/*.css",
    "web/index.html",
}

ui_page "web/index.html"
